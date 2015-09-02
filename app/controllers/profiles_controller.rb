class ProfilesController < ApplicationController
	def index
		if (params[:age_to].to_i < params[:age_from].to_i)
			redirect_to profile_search_path(current_user.id), :notice => "Invalid Age"
		else
			@user = User.search(params[:age_from], params[:age_to], params[:gender])
		end
	end

	def new 
		@user = User.new
		@user.build_address
		@user.build_physicaldetail
		@user.build_userastro
		@user.build_user_qualification
    end

	def edit
		@user = User.find(params[:id])
		@user.build_address if @user.address.nil?
		@user.build_physicaldetail if @user.physicaldetail.nil?
		@user.build_userastro if @user.userastro.nil?
		@user.build_user_qualification if @user.user_qualification.nil?
	end

	def create
		@user = User.new(user_params)
		@user.save
	end

	def update
	#	redirect_to profile_edit
		@user = User.find(params[:id])
		#@address = Address.find(params[:id])	
		#user = user + 1;
		@user.build_physicaldetail if @user.physicaldetail.nil?
		@user.build_userastro if @user.userastro.nil?
		@user.build_user_qualification if @user.user_qualification.nil?
		@user.update(user_params)
		@step = params[:step].to_s
		puts "#{@step}"*50

		if @step == "1"
			render "profiles/_step2"
		elsif @step == "2"
			render "profiles/_step3"
			#redirect_to :controller=>'profiles', :action => 'edit'
			#redirect_to profile_edit1_path(current_user.id)
		elsif @step == "3"
			redirect_to :controller=>'options', :action => 'index'
		else
			render "edit"
		end
    end

    def search 
    	@user_search = User.search(params[:age_from], params[:age_to], params[:gender])
    end

    def show
    	@user = User.search(params[:age_from], params[:age_to], params[:gender])
    end
end

private 
	def user_params
		params.require(:user).permit(:user_name, :date_of_birth, :age, :phone_no, :gender,
		 :religion_id, :caste_id, :mother_tongue_id, 
		 address_attributes: [:id, :country_id, :state_id, :city_id, :user_id], 
		 physicaldetail_attributes: [:id, :height, :weight, :body_type, :user_id, :skin_tone, :hair_color, :eye_color, :physical_status, :health_condition],
		 userastro_attributes: [:id, :user_id, :rasi_id, :nakshatra_id, :gothram_id],
		 user_qualification: [:id, :user_id, :education_id, :education_field_id, :education_level_id, :working_with, :annual_income_id, :occupation_id])
	end

	

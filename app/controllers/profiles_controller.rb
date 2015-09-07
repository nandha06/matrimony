class ProfilesController < ApplicationController
	def index
		
		if (params[:age_to].to_i < params[:age_from].to_i)
			redirect_to profile_search_path(current_user.id), :notice => "Invalid Age"
		else
			@user = User.joins(:address).where("users.id = addresses.id and addresses.country_id = ?
				and users.age >= ? and users.age <= ? and users.gender = ? and users.religion_id = ? 
				and users.mother_tongue_id = ? and addresses.state_id = ?", params[:country].to_i, params[:age_from].to_i,
				params[:age_to].to_i, params[:gender], params[:religion_id].to_i, params[:mt].to_i, params[:state].to_i)
			#respond_to :html, :json
		end
	end

	def new 
		@user = User.new
		@user.build_address
		@user.build_physicaldetail
		@user.build_userastro
		@user.build_user_qualification
		@user.build_user_partner
    end

	def edit
		@user = User.find(params[:id])
		@user.build_address if @user.address.nil?
		@user.build_physicaldetail if @user.physicaldetail.nil?
		@user.build_userastro if @user.userastro.nil?
		@user.build_user_qualification if @user.user_qualification.nil?
		@user.build_user_partner if @user.user_partner.nil?
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
		@user.build_user_partner if @user.user_partner.nil?
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
			render "profiles/_step4"
		elsif @step == "4"
			redirect_to :controller=>'options', :action => 'index'
		else
			render "edit"
		end
    end

    def filter

    	if (params[:religion] == "")
    		@user = User.joins(:address, :user_qualification).where("users.id = addresses.id and 
    			users.id = user_qualifications.user_id and users.caste_id = ?
				and users.mother_tongue_id = ? and addresses.country_id = ? and addresses.state_id = ? and 
				user_qualifications.education_level_id = ? and user_qualifications.occupation_id = ? and 
				user_qualifications.working_with = ? and user_qualifications.annual_income_id = ?", params[:caste], 
				params[:mt].to_i, params[:country].to_i, params[:state].to_i, params[:edu_level].to_i, params[:profession].to_i,
				params[:work_with], params[:income].to_i)
    	else
    	#@user = User.where("religion_id = ? and caste_id = ?", params[:religion].to_i, params[:caste].to_i)
    		@user = User.joins(:address, :user_qualification).where("users.id = addresses.id and 
    			users.id = user_qualifications.user_id and users.religion_id = ? and users.caste_id = ?
				and users.mother_tongue_id = ? and addresses.country_id = ? and addresses.state_id = ? and 
				user_qualifications.education_level_id = ? and user_qualifications.occupation_id = ? and 
				user_qualifications.working_with = ? and user_qualifications.annual_income_id = ?", params[:religion].to_i, params[:caste], 
				params[:mt].to_i, params[:country].to_i, params[:state].to_i, params[:edu_level].to_i, params[:profession].to_i,
				params[:work_with], params[:income].to_i)
    	end
    
    	render :json => @user
	end

    def search 
    	@user = User.joins(:address).where("users.id = addresses.id and addresses.country_id = ?
				and users.age >= ? and users.age <= ? and users.gender = ? and users.religion_id = ? 
				and users.mother_tongue_id = ? and addresses.state_id = ?", params[:country].to_i, params[:age_from].to_i,
				params[:age_to].to_i, params[:gender], params[:religion_id].to_i, params[:mt].to_i, params[:state].to_i)
    	#@user_search = User.search(params[:age_from], params[:age_to], params[:gender], params[:religion_id], params[:mt],
    		#params[:country_id], params[:state_id])
    end

    def show
    	@user = User.where("religion_id = ?", params[:religion].to_i)
    	@rel = params[:religion]
    	puts "#{@rel}"*50
		respond_to do |f|
			if @user
				format.html { render :index }
			else 
				puts "#{@rel}"*50
				
			end
		end#age_from = params['age_from'].to_i
    	#@user = User.where("age >= ?", age_from)
    end
end

private 
	def user_params
		params.require(:user).permit(:user_name, :date_of_birth, :age, :phone_no, :gender,
		 :religion_id, :caste_id, :mother_tongue_id, 
		 address_attributes: [:id, :country_id, :state_id, :city_id, :user_id], 
		 physicaldetail_attributes: [:id, :height, :weight, :body_type, :user_id, :skin_tone, :hair_color, :eye_color, :physical_status, :health_condition],
		 userastro_attributes: [:id, :user_id, :rasi_id, :nakshatra_id, :gothram_id],
		 user_qualification_attributes: [:id, :user_id, :education_id, :education_field_id, :education_level_id, :working_with, :annual_income_id, :occupation_id],
		 user_partner_attributes: [:id, :user_id, :age, :height, :marital_status_id, :religion_id, :caste_id, :gothram_id, :mother_tongue_id])
	end

	

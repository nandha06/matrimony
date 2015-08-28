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
    end

	def edit
		@user = User.find(params[:id])
	end

	def create
		@user = User.new(user_params)
		@user.save
	end

	def update
	#	redirect_to profile_edit
		@user = User.find(params[:id])
		
		if @user.update(user_params)
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
		params.require(:user).permit(:user_name, :date_of_birth, :age, :phone_no, :gender, :religion_id, :caste_id, :mother_tongue_id)
	end
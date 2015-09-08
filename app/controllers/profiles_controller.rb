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
    	exec_qry = ""
    		if params[:religion].present?
    			exec_qry = exec_qry + " and " + religion_param
    		end

    		if params[:caste].present?
    			exec_qry = exec_qry + " and " + caste_param
    		end

    		if params[:mt].present?
    			exec_qry = exec_qry + " and " + mt_param
    		end

    		if params[:country].present?
    			exec_qry = exec_qry + " and " + country_param
    		end

    		if params[:state].present?
    			exec_qry = exec_qry + " and " + state_param
    		end

    		if params[:edu_level].present?
    			exec_qry = exec_qry + " and " + edu_level_param
    		end

    		if params[:work_with].present?
    			exec_qry = exec_qry + " and " + work_with_param
    		end

    		if params[:profession].present?
    			exec_qry = exec_qry + " and " + profession_param
    		end

    		if params[:income].present?
    			exec_qry = exec_qry + " and " + income_param
    		end	
    		@user = User.joins(:address, :user_qualification).where("users.id = addresses.id and 
    					users.id = user_qualifications.user_id" + exec_qry)
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
    	
    end

    def religion_param
    		religion ="("
    	params[:religion].each do |i|
    		if i == params[:religion].last
    			religion = religion + "users.religion_id = " + i + ")"
    		else
				religion = religion + "users.religion_id = " + i + " or "
			end
    	end
    	return religion
    end

    def caste_param
    		caste ="("
    	params[:caste].each do |i|
    		if i == params[:caste].last
    			caste = caste + "users.caste_id = " + i + ")"
    		else
				caste = caste + "users.caste_id = " + i + " or "
			end
    	end
    	return caste
    end

    def mt_param
    		mt ="("
    	params[:mt].each do |i|
    		if i == params[:mt].last
    			mt = mt + "users.mother_tongue_id = " + i + ")"
    		else
				mt = mt + "users.mother_tongue_id = " + i + " or "
			end
    	end
    	return mt
    end

    def country_param
    		country ="("
    	params[:country].each do |i|
    		if i == params[:country].last
    			country = country + "addresses.country_id = " + i + ")"
    		else
				country = country + "addresses.country_id = " + i + " or "
			end
    	end
    	return country
    end

    def state_param
    		state ="("
    	params[:state].each do |i|
    		if i == params[:state].last
    			state = state + "addresses.state_id = " + i + ")"
    		else
				state = state + "addresses.state_id = " + i + " or "
			end
    	end
    	return state
    end

	def edu_level_param
    		edu_level ="("
    	params[:edu_level].each do |i|
    		if i == params[:edu_level].last
    			edu_level = edu_level + "user_qualifications.education_level_id = " + i + ")"
    		else
				edu_level = edu_level + "user_qualifications.education_level_id = " + i + " or "
			end
    	end
    	return edu_level
    end

    def profession_param
    		profession ="("
    	params[:profession].each do |i|
    		if i == params[:profession].last
    			profession = profession + "user_qualifications.occupation_id = " + i + ")"
    		else
				profession = profession + "user_qualifications.occupation_id = " + i + " or "
			end
    	end
    	return profession
    end

    def work_with_param
    		work_with ="("
    	params[:work_with].each do |i|
    		if i == params[:work_with].last
    			work_with = work_with + "user_qualifications.working_with = " + i + ")"
    		else
				work_with = work_with + "user_qualifications.working_with = " + i + " or "
			end
    	end
    	return work_with
    end

    def income_param
    		income ="("
    	params[:income].each do |i|
    		if i == params[:income].last
    			income = income + "user_qualifications.annual_income_id = " + i + ")"
    		else
				income = income + "user_qualifications.annual_income_id = " + i + " or "
			end
    	end
    	return income
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

	

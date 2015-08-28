class HomeController < ApplicationController
	def index
		if user_signed_in?
			redirect_to :controller=>'options', :action => 'index', :id => current_user.id
        end
	end
end

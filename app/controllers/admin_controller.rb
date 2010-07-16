class AdminController < ApplicationController
	
	before_filter :is_authorized?

	def index
		@users = User.all
	end

	private

	def is_authorized?
		if !@current_user.is_admin?
			redirect_to root_path
		end
	end
end

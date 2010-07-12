# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.



class ApplicationController < ActionController::Base
  include ActionView::Helpers::TextHelper

  before_filter CASClient::Frameworks::Rails::GatewayFilter
  before_filter :setup_cas_user
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details


  private
  	def setup_cas_user
		@message = ''
		return unless session[:cas_user].present?
		@current_user = User.find_or_create_by_caseid(session[:cas_user])
		if @current_user.name.nil?
		       @current_user.name = :cas_user
		       @message = 'Please go to your ', @current_user ,' to update your information.'
		end	       
		@current_user.present?
	end
end

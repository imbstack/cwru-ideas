class IntegrationController < ApplicationController

	def index
		respond_to do |format|
			format.html
			format.xml {header :no} #fix this up with something sensible
		end
	end
end

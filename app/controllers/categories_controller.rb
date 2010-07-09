class CategoriesController < ApplicationController
	def index
		@ideas = Category.find(:all, :order => "name")

		
    		respond_to do |format|
   		   format.html # index.html.erb 
  		   format.xml  { render :xml => @ideas }
    		end
	end

	def show
		@ideas = Category.find(params[:id]).ideas

		
    		respond_to do |format|
   		   format.html # show.html.erb 
  		   format.xml  { render :xml => @ideas }
    		end
	end

end

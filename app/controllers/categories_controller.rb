class CategoriesController < ApplicationController
	def index
		#@ideas = Category.find(:all, :order => "name")
		@tags = Category.all

		
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

	def new
		@tag = Category.new
                respond_to do |format|
      		  format.html # new.html.erb
      		  format.xml  { render :xml => @tag }
    		end
	end

	def create
		@tag = Category.create

		respond_to do |format|
      		  if @tag.save
    		    format.html { redirect_to(categories_path) }
                  else
                    format.html { render :action => "new" }
                  end
                end
	end

end

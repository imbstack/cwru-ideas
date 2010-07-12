class TagsController < ApplicationController
	def index
		@tags = Tag.all

		
    		respond_to do |format|
   		   format.html # index.html.erb 
  		   format.xml  { render :xml => @tags }
    		end
	end

	def show
		@ideas = Tag.find(params[:id]).ideas

		
    		respond_to do |format|
   		   format.html # show.html.erb 
  		   format.xml  { render :xml => @ideas }
    		end
	end

	def new
		@tag = Tag.new
                respond_to do |format|
      		  format.html # new.html.erb
      		  format.xml  { render :xml => @tag }
    		end
	end

	def create
		@tag = Tag.create

		respond_to do |format|
      		  if @tag.save
    		    format.html { redirect_to(tags_path) }
                  else
                    format.html { render :action => "new" }
                  end
                end
	end

end

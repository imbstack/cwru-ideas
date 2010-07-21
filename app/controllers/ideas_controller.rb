class IdeasController < ApplicationController
  
  #before_filter CASClient::Frameworks::Rails::GatewayFilter, :only => [:index, :show]
  before_filter CASClient::Frameworks::Rails::Filter, :except => [:index, :show]
  before_filter :setup_cas_user
  before_filter :check_permissions, :except => [:index, :show, :support, :comment]
  before_filter :add_initial_breadcrumbs

  # GET /ideas
  # GET /ideas.xml
  def index
    #@ideas = Idea.all
    @ideas = Idea.paginate :page => params[:page], :order => 'created_at DESC'


    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ideas }
    end
  end

  # GET /ideas/1
  # GET /ideas/1.xml
  def show

    @idea = Idea.find(params[:id])
    @author = User.find(@idea.user)
    #breadcrumbs.add @idea.category.name, url_for(@idea.categoyi)
    breadcrumbs.add truncate(@idea.title, :length => 30), idea_path(@idea)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @idea }
    end
  end

  # GET /ideas/new
  # GET /ideas/new.xml
  def new
    @idea = @current_user.ideas.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @idea }
    end
  end

  # GET /ideas/1/edit
  def edit
    @idea = Idea.find(params[:id])
  end

  


  # POST /ideas
  # POST /ideas.xml
  def create
    params[:idea][:tags] = params[:idea][:tags].collect { |tag| Tag.find(tag) }

    @idea = @current_user.ideas.create(params[:idea])

    respond_to do |format|
      if @idea.save
        format.html { redirect_to(@idea, :notice => 'Idea was successfully created.') }
        format.xml  { render :xml => @idea, :status => :created, :location => @idea }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @idea.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ideas/1
  # PUT /ideas/1.xml
  def update
    @idea = Idea.find(params[:id])

    respond_to do |format|
      if @idea.update_attributes(params[:idea])
        format.html { redirect_to(@idea, :notice => 'Idea was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @idea.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ideas/1
  # DELETE /ideas/1.xml
  def destroy
    @idea = Idea.find(params[:id])
    @idea.destroy

    respond_to do |format|
      format.html { redirect_to(ideas_url) }
      format.xml  { head :ok }
    end
  end

  def support
	  @idea = Idea.find(params[:id])
	  v = Vote.new( { :user_id => @current_user.id, :idea_id => params[:id] } )
	  v.register

	  respond_to do |format|
		  format.html { render :partial => 'smallidea', :locals => {:idea => @idea}}
		  format.xml {head :ok}
	  end
  end
  
  def unsupport
	  @idea = Idea.find(params[:id])
	  v = Vote.find_by_user_id_and_idea_id @current_user.id, @idea.id
	  v.destroy

	  respond_to do |format|
		  format.html { render :partial => 'smallidea', :locals => {:idea => @idea}}
		  format.xml {head :ok}
	  end
  end


  def comment
	     @idea = Idea.find(params[:id])
	     comment = @idea.comments.create(params[:comment])
	     comment.user = @current_user
	     comment.save
	     #redirect_to :action => "show", :id => params[:id]
	     render :partial => 'comments/list'
  end


  private

  def check_permissions
	  return unless !params[:id].nil?
	  creator = Idea.find(params[:id]).user.id
	  if creator != @current_user.id
		  respond_to do |format|
			  format.html { redirect_to(ideas_url)}
			  format.xml {head :method_not_allowed}
		  end
	  else
		  @is_creator = true
	  end
  end

  def add_initial_breadcrumbs
      breadcrumbs.add "Ideas", ideas_path
  end

end

class WelcomeController < ApplicationController

  
  before_filter CASClient::Frameworks::Rails::Filter, :only => [:login]


  def index	 
    @ideas = Idea.all
    @last = @ideas.last

  end

  def login 
	  redirect_to root_path
  end


end

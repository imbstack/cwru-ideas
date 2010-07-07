class WelcomeController < ApplicationController
  def index	 
    ideas = Idea.all
    @last = ideas.last

  end


end

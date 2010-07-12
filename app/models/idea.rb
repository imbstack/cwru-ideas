class Idea < ActiveRecord::Base

  belongs_to :user
  belongs_to :tag
  has_many :comments

  def get_creator_name
	  creator = User.find(self.creator)
	  return creator.name
  end


  def vote(dir)
	#make this do something to supports or remove it?  
	self.save
  end

  def add_creator(creator)
	  self.creator = creator
	  self.save
  end



end

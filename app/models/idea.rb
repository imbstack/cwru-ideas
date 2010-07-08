class Idea < ActiveRecord::Base

  has_many :comments

  def get_creator_name
	  creator = User.find(self.creator)
	  return creator.name
  end


  def vote(dir)
		if dir.eql? 'up'
			self.upvotes += 1
		elsif dir.eql? 'down' 
			self.downvotes += 1
		elsif dir.eql? 'new'
			self.upvotes = 1
			self.downvotes = 0
		end
		self.save
  end

  def add_creator(creator)
	  self.creator = creator
	  self.save
  end



end

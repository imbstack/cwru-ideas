class Idea < ActiveRecord::Base


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



end

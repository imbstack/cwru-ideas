class Comment < ActiveRecord::Base
	belongs_to :idea

	def add_creator(creator)
		self.creator = creator
		self.save
	end
end

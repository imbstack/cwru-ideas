class Comment < ActiveRecord::Base

	belongs_to :idea
	belongs_to :user

	validates_presence_of :body, :user

end

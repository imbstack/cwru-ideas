class User < ActiveRecord::Base
	has_many :ideas
	has_many :comments
end

class User < ActiveRecord::Base
	has_many :ideas
	has_many :comments
	has_many :tags
	easy_roles :roles
end

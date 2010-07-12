class User < ActiveRecord::Base
	has_many :ideas
	has_many :comments
	easy_roles :roles
end

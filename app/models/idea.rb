class Idea < ActiveRecord::Base

  belongs_to :user
  has_and_belongs_to_many :tags
  has_many :comments

  validates_presence_of :body, :title
end

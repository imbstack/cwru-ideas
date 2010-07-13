class Idea < ActiveRecord::Base

  belongs_to :user
  belongs_to :tag
  has_many :comments

  validates_presence_of :body, :title
end

class Idea < ActiveRecord::Base

  belongs_to :user
  has_and_belongs_to_many :tags
  has_many :comments

  validates_presence_of :body, :title

  cattr_reader :per_page
  @@per_page = 10

end

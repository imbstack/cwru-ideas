class AddIdeaIdToComments < ActiveRecord::Migration
  def self.up
	  add_column 'comments', 'idea_id', :integer
  end

  def self.down
	  remove_column 'comments', 'idea_id'
  end
end

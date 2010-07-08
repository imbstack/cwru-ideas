class RemoveUpvotesAndDownvotes < ActiveRecord::Migration
  def self.up
	remove_column :ideas, :upvotes
	remove_column :ideas, :downvotes
  end

  def self.down
	add_column :ideas, :upvotes, :integer
	add_column :ideas, :downvotes, :integer
  end
end

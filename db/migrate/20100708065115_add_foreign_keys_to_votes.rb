class AddForeignKeysToVotes < ActiveRecord::Migration
  def self.up
	add_column :votes, :user_id, :integer
	add_column :votes, :idea_id, :integer
  end

  def self.down
	remove_column :votes, :user_id
	remove_column :votes, :idea_id
  end
end

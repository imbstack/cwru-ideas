class AddUserToComments < ActiveRecord::Migration
  def self.up
	  rename_column 'comments', 'creator', 'user_id'
  end

  def self.down
	  rename_column 'comments', 'user_id', 'creator'
  end
end

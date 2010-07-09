class RemoveCreatorAddUser < ActiveRecord::Migration
  def self.up
	  rename_column 'ideas', 'creator', 'user_id'
  end

  def self.down
	  rename_column 'ideas',  'user_id', 'creator'
  end
end

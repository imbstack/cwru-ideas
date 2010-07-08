class AddCategoriesToIdeas < ActiveRecord::Migration
  def self.up
	add_column :ideas, :category, :string
  end

  def self.down
	  remove_column :ideas, :category
  end
end

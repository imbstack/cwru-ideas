class CategoryColumnChanging < ActiveRecord::Migration
  def self.up
	  rename_column :ideas, :category, :category_id
	  change_column :ideas, :category_id, :integer
  end

  def self.down
	  rename_column :ideas, :category_id, :category
	  change_column :ideas, :category, :string
  end
end

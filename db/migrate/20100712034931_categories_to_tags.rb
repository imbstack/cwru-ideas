class CategoriesToTags < ActiveRecord::Migration
  def self.up
	  rename_table 'categories', 'tags'
	  rename_column 'ideas', 'category_id', 'tag_id'
  end

  def self.down
	  rename_table 'tags', 'categories'
	  rename_column 'ideas', 'tag_id', 'category_id'
  end
end

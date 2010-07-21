class AddJoinTableIdeasTags < ActiveRecord::Migration
  def self.up
	  create_table :ideas_tags, :id => false do |t|
		  t.integer :idea_id
		  t.integer :tag_id
	  end
  end

  def self.down
	  drop_table :ideas_tags
  end
end

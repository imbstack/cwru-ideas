class MoveTagsFromIdeas < ActiveRecord::Migration
  def self.up
	Idea.find(:all).each { |idea| idea.tags.push(Tag.find(idea.tag_id)) }
	remove_column :ideas, :tag_id
  end

  def self.down
	add_column :ideas, :tag_id, :integer
	Idea.find(:all).each { |idea| idea.tag_id = Idea.tags.find(:all).last.id ; idea.save}
  end
end

class AddCreatorRemoveAuthor < ActiveRecord::Migration
  def self.up
	  add_column "ideas", "creator", :integer
	  remove_column "ideas", "author"
  end

  def self.down
	  remove_column "ideas", "creator"
	  add_column "ideas", "author", :string
  end
end

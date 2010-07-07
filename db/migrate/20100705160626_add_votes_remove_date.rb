class AddVotesRemoveDate < ActiveRecord::Migration
  def self.up
	  add_column "ideas", "upvotes", :integer
	  add_column "ideas", "downvotes", :integer
	  remove_column "ideas", "date"
  end

  def self.down
  end
end

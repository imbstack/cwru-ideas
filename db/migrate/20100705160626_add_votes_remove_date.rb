class AddVotesRemoveDate < ActiveRecord::Migration
  def self.up
	  add_column "ideas", "upvotes", :integer
	  add_column "ideas", "downvotes", :integer
	  remove_column "ideas", "date"
  end

  def self.down
	  remove_column "ideas", "upvotes"
	  remove_column "ideas", "downvotes"
	  add_column "ideas", "date", :date
  end
end

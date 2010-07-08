class Vote < ActiveRecord::Base
	def register
		if self.exists
			return
		end
		self.save()
	end
	def exists
		return !(Vote.find(:all, :conditions => ['user_id = ? AND idea_id = ?', self.user_id, self.idea_id]).length == 0)
	end
end

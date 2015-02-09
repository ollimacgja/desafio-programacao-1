class Purchase < ActiveRecord::Base
	belongs_to :item
	before_create :get_total

	def get_total
		self.total = item.price * count
	end
end

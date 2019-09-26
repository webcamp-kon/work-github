class Delivery < ApplicationRecord
	belongs_to :user,optional: true
	# has_many :order_histories
	def view_address_and_id
        self.id.to_s + ' :  ' + self.address + ' '
    end
end

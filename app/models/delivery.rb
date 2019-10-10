class Delivery < ApplicationRecord
	belongs_to :user,optional: true
	validates :post_number, presence: true
	validates :telephone_number, presence: true
	validates :first_name, presence: true
	validates :last_name, presence: true
	# has_many :order_histories
	def view_address_and_id
        self.id.to_s + ' :  ' + self.address + ' '
    end

end
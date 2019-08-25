class OrderHistory < ApplicationRecord
	belongs_to :user
	belongs_to :address
	has_many :order_lists
end

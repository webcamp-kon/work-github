class OrderHistory < ApplicationRecord
	belongs_to :user
	belongs_to :address,optional: true
	has_many :order_lists
end

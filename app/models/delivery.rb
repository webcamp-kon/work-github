class Delivery < ApplicationRecord
	belongs_to :user,optional: true
	# has_many :order_histories
end

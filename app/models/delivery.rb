class Delivery < ApplicationRecord
	belongs_to :user
	has_many :order_histories
end

class CartItem < ApplicationRecord
	belongs_to :user
	belongs_to :product
	# def self.adding(my_id)
	# 	# data=CartItem.where(user_id: my_id).products.sum(:price)
	# 	# return data
	# end
end

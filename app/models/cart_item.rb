class CartItem < ApplicationRecord
	belongs_to :user,optional: true
	belongs_to :product,optional: true
	# def self.adding(my_id)
	# 	# data=CartItem.where(user_id: my_id).products.sum(:price)
	# 	# return data
	# end
end

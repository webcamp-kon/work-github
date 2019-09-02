class CartItem < ApplicationRecord
	belongs_to :user
	belongs_to :product
	def self.adding
		CartItem.where(user_id: current_user.id).product.sum(:price)
	end
end

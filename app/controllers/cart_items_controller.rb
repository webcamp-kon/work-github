class CartItemsController < ApplicationController
	def index
		@cart_items = current_user.cart_items
		# @sum = CartItem.adding(current_user.id)
		# @sum =CartItem.where(user_id: current_user.id).products.sum(:price)
	end
end

class CartItemsController < ApplicationController
	def index
		@cart_items = current_user.cart_items
		@sum = CartItem.adding
	end
end

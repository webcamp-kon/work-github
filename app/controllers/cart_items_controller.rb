class CartItemsController < ApplicationController
	def index
		@cart_items = current_user.cart_items
		# @sum = CartItem.adding(current_user.id)
		# @sum =CartItem.where(user_id: current_user.id).products.sum(:price)
	end
	def create
		# product = Product.find(params[:product_id])
		cart_item = current_user.cart_items.new
		cart_item.product_id = :product_id
		cart_item.save
		redirect_to cart_items_path
	end
end

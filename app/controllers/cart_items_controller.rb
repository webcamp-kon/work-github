class CartItemsController < ApplicationController
	def index
		@cart_items = current_user.cart_items
		# @sum = CartItem.adding(current_user.id)
		# @sum =CartItem.where(user_id: current_user.id).products.sum(:price)
	end
	def plus
		cart_item = CartItem.find(params[:cart_item_id])
		cart_item.increment(:order_number, 1)
		cart_item.save
		redirect_to cart_items_path
	end
	def minus
		cart_item = CartItem.find(params[:cart_item_id])
		cart_item.decrement(:order_number, 1)
		cart_item.save
		redirect_to cart_items_path
	end
	def create
		cart_items = current_user.cart_items
		product = Product.find(params[:product_id])
		if product
		cart_item = current_user.cart_items.new
		cart_item.product_id = product.id
		cart_item.save
		redirect_to cart_items_path
	end
end

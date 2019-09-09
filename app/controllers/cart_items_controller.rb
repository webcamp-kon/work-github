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
	def new

	end
	def create
		# product = Product.find(params[:product_id])
		cart_item = current_user.cart_items.new
		cart_item.product_id = :product_id
		cart_item.save
		redirect_to cart_items_path
	end
	def confirm

	end
	def completed

	end
end

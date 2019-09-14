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
		@cart_item =current_user.cart_items
		@delivery_fee = 500
		@address = current_user.addresses
		# @address.insert(0,new_add)
	end
	def create
		
		# product = Product.find(params[:product_id])
		cart_item = current_user.cart_items.new
		cart_item.user_id=current_user.id
		cart_item.product_id = params[:product_id]
		cart_item.order_number=1
		cart_item.save!
		redirect_to cart_items_path
	end
	def confirm
		@cart_items = current_user.cart_items
		@delivery_fee = 500
	end
	def completed
		 if params[:radiradi] == "新規作成"
			address = Addresse.new
			address.user_id = current_user.id
			address.address =params[:address]
			address.post_number = params[:post_number]
			address.save!
			order = OrderHistory.new
			order.user_id = current_user.id
			order.buy_date = DateTime.now
			order.step = 0
			order.order_status = "準備中"
			order.method_of_pay = params[:method_of_pay]
			order.sum = params[:sum]
			order.delivery_fee = params[:delivery_fee]
			order.address_id = params[:address_id]
			order.send_to_first_name = params[:first_name]
			order.send_to_last_name = params[:last_name]
			order.send_to_post_number = params[:post_number]
			order.send_to_telephone_number = params[:telephone_number]
			order_id = OrderHistory.count+1
			order.save!
		elsif params[:radiradi] == "住所の選択"
			order = OrderHistory.new
			order.user_id = current_user.id
			order.buy_date = DateTime.now
			order.step = 0
			order.order_status = "準備中"
			order.method_of_pay = params[:method_of_pay]
			order.sum = params[:sum]
			order.delivery_fee = params[:delivery_fee]
			order.address_id = params[:address_id]
			order.send_to_first_name = params[:first_name]
			order.send_to_last_name = params[:last_name]
			order.send_to_post_number = params[:post_number]
			order.send_to_telephone_number = params[:telephone_number]
			order_id = OrderHistory.count+1
			order.save!
		end
		cart_items = current_user.cart_items
		cart_items.each do |cart_item|
			n_order_list = nil
			n_order_list = OrderList.new
			n_order_list.order_history_id =order_id
			n_order_list.product_id = cart_item.product_id
			n_order_list.amount = cart_item.order_number
			n_order_list.price = cart_item.product.price # 単品価格でよかったっけ？
			n_order_list.save!
			n_order_list = ""
		end


		
	end
	private
	def cart_item_params
		params.require(:cart_item).permit(:user_id,:product_id,:order_number)
	end
	def order_list_params
		params.require(:order_list).permit(:order_history_id,:product_id,:amount,:price)
	end
end

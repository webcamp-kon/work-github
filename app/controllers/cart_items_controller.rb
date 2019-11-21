class CartItemsController < ApplicationController
PER = 5
	def index
		@cart_items = current_user.cart_items.page(params[:page]).per(PER)
		@sum = 0
		@cart_items.each do |cart_item_single|
			@sum+=1
		end
		@user = current_user
		@ZAN = 0
		@cart_items2 = CartItem.where(product_id: params[:id])
		@cart_items2.each do |cart_item|
			@ZAN += cart_item.order_number
		end
		# @sum = CartItem.adding(current_user.id)
		# @sum =CartItem.where(user_id: current_user.id).products.sum(:price)
	end
	def destroy
		cart_item = CartItem.find(params[:id])
		cart_item.destroy
		redirect_to cart_items_path
	end
	def adding
		cart_item = CartItem.find(params[:cart_item_id])
		cart_item.increment(:order_number, 1)
		cart_item.save
		redirect_to cart_items_path
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
		@address = current_user.deliveries
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
		cart_items = current_user.cart_items
		order = OrderHistory.new
		case params[:radiradi] when "新規作成" then
			address = Delivery.new
			address.user_id = current_user.id
			address.address =params[:address]
			address.first_name = params[:first_name]
			address.last_name = params[:last_name]
			address.post_number = params[:post_number]
			address.telephone_number = params[:telephone_number]
			if address.save
				order=set_address(
					order,
					address_id,params[:first_name],
					params[:last_name],params[:post_number],
					params[:telephone_number],params[:address]
				)
				complete_first(order,:method_of_pay,cart_items)
			else
				not_completed("住所を入力してください")
			end
		when "住所の選択" then
			order=set_address(
				order,params[:address_id],
				Delivery.find(params[:address_id]).address,
				Delivery.find(params[:address_id]).first_name,
				Delivery.find(params[:address_id]).last_name,
				Delivery.find(params[:address_id]).post_number,
				Delivery.find(params[:address_id]).telephone_number
			)
			complete_first(order,:method_of_pay,cart_items)
		else
			not_completed("住所の選択を行ってください")
		end
	end



	# 注文モデルに住所関係の情報の割り振りを行う
	def set_address(order,address_id,address_main,first_name,last_name,post_number,telephone_number)
		order.address_id = address_id
		order.send_to_address = address_main
		order.send_to_first_name = first_name
		order.send_to_last_name = last_name
		order.send_to_post_number = post_number
		order.send_to_telephone_number = telephone_number
		return order
	end

	# その他情報の構成からセーブ処理、繊維処理まで行う
	def complete_first(order,method_of_pay,cart_items)
		order.user_id = current_user.id
		order.buy_date = DateTime.now
		order.step = 0
		order.order_status = "準備中"
		order.method_of_pay = params[method_of_pay]
		order.sum = 0
		order.delivery_fee =500
		order_id = OrderHistory.count+1
		cart_items.each do |cart_item|
			require "date"
			d1 = Date.today;
			d2 = Date.parse("2019/10/1");
			if d1 < d2
				order.sum = cart_item.product.price*cart_item.order_number*1.08+order.sum
			else
				order.sum = cart_item.product.price*cart_item.order_number*1.1+order.sum
			end
		end
		chk_flg=false #在庫確認処理
		cart_items.each do |cart_item|
			if cart_item.product.stock_quantity<cart_item.order_number
				chk_flg=true
			end
		end
		
		if order.save! #支払い方法は入力されているか
			if chk_flg==false
				cart_items.each do |cart_item|
					n_order_list = nil
					n_order_list = OrderList.new
					n_order_list.order_history_id =order_id
					n_order_list.product_id = cart_item.product_id
					n_order_list.amount = cart_item.order_number
					require "date"
					d1 = Date.today;
					d2 = Date.parse("2019/10/1");
					if d1 < d2
						n_order_list.price = cart_item.product.price*1.08
					else
						n_order_list.price = cart_item.product.price*1.1
					end
					n_order_list.save!
					cart_item.product.decrement(:stock_quantity, cart_item.order_number)
					cart_item.product.save!
					cart_item.destroy
				end
			else
				not_completed("注文数分の在庫を確認できませんでした")
			end
		else
			not_completed("支払方法を入力してください")
		end
	end

	# 適切な処理ができなかった場合の再遷移処理
	def not_completed(tsukudani)
		@cart_item =current_user.cart_items
		@delivery_fee = 500
		@address = current_user.deliveries
		flash[:notice] =tsukudani
		render 'new'
	end

	private
	def cart_item_params
		params.require(:cart_item).permit(:user_id,:product_id,:order_number)
	end
	def order_list_params
		params.require(:order_list).permit(:order_history_id,:product_id,:amount,:price,:sum)
	end
	def product_params
		params.require(:product).permit(:stock_quantity)
	end
end

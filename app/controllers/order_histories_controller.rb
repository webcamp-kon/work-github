class OrderHistoriesController < ApplicationController
	PER = 5
	def index
		@order_histories = OrderHistory.page(params[:page]).per(10)
		# @fee = 1.08.to_i
	end
	private
	# def order_history_params
	# 	params.require(:order_history).permit()
	# end
	# def order_list_params
	# 	params.require(:order_list).permit(:order_history_id,:product_id,:amount,:price)
	# end
  	# def product_params
    # 	params.require(:product).permit(:jacket_image,)
  	# end
end

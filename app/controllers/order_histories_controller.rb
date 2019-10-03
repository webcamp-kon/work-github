class OrderHistoriesController < ApplicationController
	PER = 5
	def index
		@order_histories = OrderHistory.page(params[:page]).per(10)
	end
end

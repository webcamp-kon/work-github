class OrderHistoriesController < ApplicationController
	def index
		@order_histories = current_user.order_histories
	end
end

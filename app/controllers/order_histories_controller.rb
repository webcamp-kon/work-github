class OrderHistoriesController < ApplicationController
	PER = 5
	def index
		@user = current_user
		@order_histories = @user.order_histories.page(params[:page]).per(10)
	end
end

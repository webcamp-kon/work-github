class Admin::OrderHistoriesController < ApplicationController
	def index
    @order_histories=OrderHistory.page(params[:page]).per(10)
  end
end

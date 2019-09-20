class Admin::OrderHistoriesController < ApplicationController
  before_action :authenticate_admin_manager!	
	def index
    @order_histories=OrderHistory.page(params[:page]).per(10)
  end
end

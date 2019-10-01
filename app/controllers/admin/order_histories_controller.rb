class Admin::OrderHistoriesController < ApplicationController
  before_action :authenticate_admin_manager!
	def index
    @order_histories=OrderHistory.page(params[:page]).per(10)
  end
  def edit
    @order_history=OrderHistory.find(params[:id])
    @order_list = OrderList.find(params[:id])

  end
  def show
    @order_history=OrderHistory.find(params[:id])
     @order_lists = OrderList.find(params[:id])
     @products = @order_lists.product
  end
  def update
    @order_history=OrderHistory.find(params[:id])
    if @order_history.update(order_history_params)
       flash[:notice] ="You have updated order_history successfully."
       redirect_to admin_order_histories_path
    else
      render "edit"
    end
  end
  def destroy
    @order_histories=OrderHistory.find(params[:id])
    @order_histories.destroy
    redirect_to admin_order_histories_path
  end
  private
  def order_history_params
   params.require(:order_history).permit(:send_to_first_name,:send_to_last_name,:send_to_address,:send_to_post_number,:delivery_fee,:method_of_pay,:order_status,:sum,order_lists_attributes: [:product_id,:price,:amount])
  end
end

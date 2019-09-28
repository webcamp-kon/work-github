class Admin::OrderHistoriesController < ApplicationController
  before_action :authenticate_admin_manager!	
	def index
    @order_histories=OrderHistory.page(params[:page]).per(10)
  end
  def edit
    @order_history=OrderHistory.find(params[:id])
    @sonh = OrderList.find(params[:id])
  end
  def show
    @order_history=OrderHistory.find(params[:id])
  end
  def update
    @order_histories=OrderHistory.find(params[:id])
    if @order_histories.update(order_history_params)
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
  def order_history_params
   params.require(:order_history).permit()
  end
  def order_list_params
    params.require(:order_list).permit(:order_history_id,:product_id,:amount,:price)
  end
  def product_params
     params.require(:product).permit(:jacket_image)
  end
end

class Admin::OrderHistoriesController < ApplicationController
  before_action :authenticate_admin_manager!	
	def index
    @order_histories=OrderHistory.page(params[:page]).per(10)
  end
  def edit
    @order_histories=OrderHistory.find(params[:id])
    @artists=Artist.all
    @labels=Label.all
    @genres=Genre.all
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
end

class Admin::ProductsController < ApplicationController
  def index
    @products=Product.all
  end

  def new
    @product=Product.new
  end
  def create
    product=Product.new(product_params)
  end
  def edit
    @product=Product.find(params[:id])
  end
  def update
    product=Product.find(params[:id])
  end
  def arrive

  end

  def show
    @product=Product.find(params[:id])
  end
  def destroy
    @product=Product.find(params[:id])
  end

  private
  def product_params
    params.require(:product).permit(:)
  end
end

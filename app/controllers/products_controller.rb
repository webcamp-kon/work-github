class ProductsController < ApplicationController
  def index
    @products=Product.all
    @user=current_user
  end

  def search
    @products=Product.search(params[:search])
    @user=current_user
    @search=params[:search]
  end

  def ranking
    @products=Product.ranking
  end

  def show
    @product=Product.find(params[:id])
    @review = Review.new
    @reviews = @product.reviews
  end
  private
  def product_params
   # params.require(:product).permit(:)
  end
end

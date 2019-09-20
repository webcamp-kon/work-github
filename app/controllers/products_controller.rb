class ProductsController < ApplicationController
  PER=2
  def index
    @products=Product.page(params[:page]).per(PER)
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
    if user_signed_in?
      @cart_items = current_user.cart_items
    end
  end
  private
  def product_params
   # params.require(:product).permit(:)
  end
end

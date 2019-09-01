class Admin::ProductsController < ApplicationController
  def index
    @products=Product.all
  end

  def new
    @product=Product.new
    @artists=Artist.all
    @labels=Label.all
    @genres=Genre.all
  end
  def create
    @product=Product.new(product_params)
    @product.save
    redirect_to admin_products_path
  end
  def edit
    @product=Product.find(params[:id])
  end
  def update
    product=Product.find(params[:id])
  end
  def arrive
    @product=Product.find(params[:id])
  end
  def arrived
    @product=Product.find(params[:id])
    @product.stock_quantity+=:addstock
    @product.save
  end

  def show
    @product=Product.find(params[:id])
  end
  def destroy
    @product=Product.find(params[:id])
  end
  private
  def product_params
    params.require(:product).permit(:artist_id,:label_id,:genre_id,:jacket_image_id,:released_date,:stock_quantity,:price,:is_selling,discs_attributes:[:product_id,:ordinal_number,songs_attributes:[:disc_id,:title,:ordinal_number]])
  end
end

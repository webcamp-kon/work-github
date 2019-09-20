class Admin::ProductsController < ApplicationController
  before_action :authenticate_admin_manager!	
  PER=5

  def index
    @products=Product.page(params[:page]).per(PER)
  end

  def new
    @product=Product.new
    @artists=Artist.all
    @labels=Label.all
    @genres=Genre.all

  end
  def create
    product=Product.new(product_params)
    product.save
    redirect_to admin_products_path
  end
  def edit
    @product=Product.find(params[:id])
    @artists=Artist.all
    @labels=Label.all
    @genres=Genre.all
  end
  def update
    product=Product.find(params[:id])
    product.update(product_params)
    redirect_to admin_products_path
  end
  def arrive
    @product=Product.find(params[:id])
  end
  def arrived
    @product=Product.find(params[:id])
    @product.stock_quantity=@product.stock_quantity+params[:addStock].to_i
    @product.save
  end

  def show
    @product=Product.find(params[:id])

  end
  def destroy
    @product=Product.find(params[:id])
    @product.destroy
    redirect_to admin_products_path
  end
  private
  def product_params
    params.require(:product).permit(:jacket_image,:name,:artist_id,:label_id,:genre_id,:released_date,:stock_quantity,:price,:is_selling,discs_attributes:[:product_id,:ordinal_number,songs_attributes:[:disc_id,:title,:ordinal_number]])
  end
end

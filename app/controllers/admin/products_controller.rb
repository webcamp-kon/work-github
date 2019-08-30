class Admin::ProductsController < ApplicationController
  def index
    @products=Product.all
  end

  def new
    @product=Product.new
    @disk=@product.disks.build
    @disk.songs.build
  end
  def create
    product=Product.new(product_params)
    product.save
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
    params.require(:product).permit(:artist_id,:label_id,:genre_id,:jacket_image,:released_date,:stock_quantity,:price,:is_selling)
  end
end

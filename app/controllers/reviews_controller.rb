class ReviewsController < ApplicationController
	def edit
		@review = Review.page(params[:page]).reverse_order
	end
	def destroy
		@review = Review.find(params[:id])
	end
	def update
		@review = Review.find(params[:id])
	end
	def index
		@reviews = Review.all
		@product=Product.all
	end
	def create
		product = Product.find(params[:product_id])
		review = current_user.reviews.new(review_params)
		review.product_id = product.id
		review.save
		redirect_to product_path(product)
	end
	private
	def review_params
		params.require(:review).permit(:title, :main_sentence, :user_id, :product_id)
	end
end

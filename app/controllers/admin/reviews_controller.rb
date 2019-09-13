class Admin::ReviewsController < ApplicationController
    def edit
		@review = Review.find(params[:id])
		@user = User.all
		@product = Product.all
	end
	def show
		@review = Review.find(params[:id])
        @product = @review.product
    end
	# def update
		# @review = Review.find(params[:id])
        # if @review.update(review_params)
         # flash[:notice] ="You have updated book successfully."
         # redirect_to admin_review_path(@review.id)
        # else
        # render "edit"
     # end
	# end
	def index
		@reviews=Review.page(params[:page]).per(10)
	end
	def destroy
      @review = Review.find(params[:id])
      @review.destroy
      redirect_to admin_reiviews_path
    end
	private
	def review_params
		params.require(:review).permit(:title, :main_sentence, :user_id, :product_id)
	end
end

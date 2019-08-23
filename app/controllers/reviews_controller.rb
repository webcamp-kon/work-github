class ReviewsController < ApplicationController
	def edit
		@review = Review.find(param[:id])
	end
	def destroy
		@review = Review.find(param[:id])
	end
	def update
		@review = Review.find(param[:id])
	end
	def index
		@reviews = Review.all
	end
end

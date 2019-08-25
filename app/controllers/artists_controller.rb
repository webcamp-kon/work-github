class ArtistsController < ApplicationController
	def index
		@reviews = Review.all
	end
	def edit
		@review = Review.find(params[:id])
	end
	def update
		@review = Review.find(params[:id])
	end
	def destroy
		@review = Review.find(params[:id])
	end
end

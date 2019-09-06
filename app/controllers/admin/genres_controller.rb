class Admin::GenresController < ApplicationController
	PER=5
	def index
		@genres = Genre.page(params[:page]).per(PER)
	end
	def new

	end
	def create

	end
	def edit
		@genre = Genre.find(params[:id])
	end
	def update
		@genre = Genre.find(params[:id])
		@genre.update(genre_params)
	end
	def destroy
		@genre = Genre.find(params[:id])
	end
	private
	def genre_params
		params.require(:genre).permit(:name)
	end
end

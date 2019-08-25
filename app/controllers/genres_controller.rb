class GenresController < ApplicationController
	def index
		@genres = Genre.all
	end
	def edit
		@genre = Genre.find(param[:id])
	end
	def update
		@genre = Genre.find(param[:id])
	end
	def destroy
		@genre = Genre.find(param[:id])
	end
end

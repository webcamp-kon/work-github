class Admin::ArtistsController < ApplicationController
	PER=5
	def index
		@artists = Artist.page(params[:page]).per(PER)
	end
	def new

	end
	def create

	end
	def edit
		@artist = Artist.find(params[:id])
	end
	def update
		@artist = Artist.find(params[:id])
		@artist.update(artist_params)
	end
	def destroy
		@Artist = Artist.find(params[:id])
	end
	private
	def artist_params
		params.require(:artist).permit(:name)
	end
end

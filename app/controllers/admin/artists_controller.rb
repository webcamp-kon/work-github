class Admin::ArtistsController < ApplicationController
	PER=5
	def index
		@artists = Artist.page(params[:page]).per(PER)
	end
	def new
		@artist=Artist.new
	end
	def create
		artist=Artist.new(artist_params)
		artist.save
		redirect_to admin_artists_path
	end
	def edit
		@artist = Artist.find(params[:id])
	end
	def update
		@artist = Artist.find(params[:id])
		@artist.update(artist_params)
		redirect_to admin_artists_path
	end
	def destroy
		artist = Artist.find(params[:id])
		artist.destroy
		redirect_to admin_artists_path

	end
	private
	def artist_params
		params.require(:artist).permit(:name)
	end
end

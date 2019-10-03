class Admin::GenresController < ApplicationController
	before_action :authenticate_admin_manager!
	PER=5
	def index
		@genres = Genre.page(params[:page]).per(PER)
	end
	def new
		@genre=Genre.new
	end
	def create
		genre=Genre.new(genre_params)
		genre.save
		redirect_to admin_genres_path
	end
	def edit
		@genre = Genre.find(params[:id])
	end
	def update
		@genre = Genre.find(params[:id])
		if @genre.update(genre_params)
		  flash[:notice] ="You have updated genre successfully."
		  redirect_to admin_genres_path
		else
		  render "edit"
		end
	end
	def destroy
		genre = Genre.find(params[:id])
		genre.destroy
		redirect_to admin_genres_path
	end
	private
	def genre_params
		params.require(:genre).permit(:name)
	end
end

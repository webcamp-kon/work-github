class UsersController < ApplicationController
	before_action :cuser, only: [:update, :edit]
	def edit
		@user = current_user
	end
	def update
		user = current_user
		user.update(user_params)
		redirect_to root_path
	end
	def show
		@products = Product.all
		@user = current_user
	end
	def leave
		user = User.find(params[:id])
    user.is_deleted = true
    user.save
    redirect_to root_path
	end
	private
	def user_params
		params.require(:user).permit(:email,:first_name,:first_name_kana,:last_name_kana,:last_name,:telephone_number,:post_number,:address)
	end
	def cuser
	cuser=User.find(params[:id])
	if cuser != current_user
		redirect_to user_path(current_user)
	end
end
end

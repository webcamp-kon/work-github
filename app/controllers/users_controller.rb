class UsersController < ApplicationController
	def edit
		@user = current_manager
	end
	def update
		@user = current_manager
	end
	private
	def user_params
		params.require(:user).permit(:email,:first_name,:first_name_kana,:last_name_kana,:last_name,:address_id,:is_deleted,:telephone_number,:post_number,:address)
	end
end

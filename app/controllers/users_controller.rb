class UsersController < ApplicationController
	def edit
		@user = current_manager
	end
	def update
		@user = current_manager
	end
end

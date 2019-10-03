class Admin::ManagersController < ApplicationController
	before_action :authenticate_admin_manager!
	def edit
		@manager = current_admin_manager
	end
	def update
		@manager = current_admin_manager
		@manager.update(manager_params)
		redirect_to admin_root_top_path
	end
	private
	def manager_params
		params.require(:manager).permit(:first_name,:last_name,:email,:password)
	end
end

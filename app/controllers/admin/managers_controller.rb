class ManagersController < ApplicationController
	def edit
		@manager = current_manager
	end
	def update
		@manager = current_manager
	end
end

class Admin::LabelsController < ApplicationController
	before_action :authenticate_admin_manager!	
	PER=5
	def index
		@labels = Label.page(params[:page]).per(PER)
	end
	def new
		@label=Label.new
	end
	def create
		label=Label.new(label_params)
		label.save
		redirect_to admin_labels_path
	end
	def edit
		@label = Label.find(params[:id])
	end
	def update
		@label = Label.find(params[:id])
		@label.update(label_params)
		redirect_to admin_labels_path
	end
	def destroy
		label = Label.find(params[:id])
		label.destroy
		redirect_to admin_labels_path
	end
	private
	def label_params
		params.require(:label).permit(:name)
	end
end

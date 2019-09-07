class Admin::LabelsController < ApplicationController
	PER=5
	def index
		@labels = Label.page(params[:page]).per(PER)
	end
	def new

	end
	def create

	end
	def edit
		@label = Label.find(params[:id])
	end
	def update
		@label = Label.find(params[:id])
		@label.update(label_params)
	end
	def destroy
		@label = Label.find(params[:id])
	end
	private
	def label_params
		params.require(:label).permit(:name)
	end
end

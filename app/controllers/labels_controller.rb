class LabelsController < ApplicationController
	def index
		@labels = Label.all
	end
	def edit
		@label = Label.find(param[:id])
	end
	def destroy
		@label = Label.find(param[:id])
	end
	def update
		@label = Label.find(param[:id])
	end
end

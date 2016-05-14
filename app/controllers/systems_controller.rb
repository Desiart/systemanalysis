class SystemsController < ApplicationController

	def index
		@systems = System.all
	end

	def show
		@system = System.find_by_id(params[:id])
	end

	def new
		@system = System.new
	end

	def create
		@image = System.new
	end

	def edit
	end

	def update
	end

	def destroy
	end
end

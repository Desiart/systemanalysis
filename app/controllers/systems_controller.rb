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
		@system = System.create(system_params)
		redirect_to systems_path
	end

	def edit
	end

	def update
	end

	def destroy
	end

private 

def system_params
			params.require(:system).permit(:name,:description,:details)
end

end

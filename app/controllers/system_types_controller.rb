class SystemTypesController < ApplicationController

	def new
		@system_type = SystemType.new
	end

	def create
		@system_type = SystemType.create(system_params)
		redirect_to root_path
	end

private 

	def system_params
				params.require(:system_type).permit(:name)
	end

end

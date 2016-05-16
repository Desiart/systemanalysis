class SystemsController < ApplicationController

	before_filter :load_user

	def index
		@systems = System.all
	end

	def show
		@system = System.find_by_id(params[:id])
		@users = @system.users
	end

	def new
		@system = System.new
	end

	def create
		@system = System.create(system_params)
		@user.system_lists.create(system: @system)
		redirect_to systems_path
	end

	def edit
	end

	def update
	end

	def destroy
		@system = System.find_by_id(params[:id])
		@system.destroy
		redirect_to systems_path
	end

	def add_users_form
		@system = System.find_by_id(params[:id])
		@users = User.all
		@ids = params[:user_ids]
	end

	def add_users
		@system = System.find_by_id(params[:id])
		ids = params[:user_ids]
		ids.each do |i|
			user = User.find_by_id(i)
			@system.users << user
		end
		redirect_to system_path(@system)
	end

private 

	def system_params
				params.require(:system).permit(:name,:description,:details)
	end

	def load_user
		@user = current_user
	end

end

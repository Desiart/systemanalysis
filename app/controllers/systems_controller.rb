class SystemsController < ApplicationController


	before_filter :load_user
	before_filter :signed_in, only:[:index,:leave,:destroy,:add_users,:add_users_form,:edit,:update,:destroy_users,:new,:create]
	before_filter :check_if_admin, only:[:index]
	before_filter :load_system, only:[:leave,:destroy,:add_users,:add_users_form,
		:show,:edit,:update,:destroy_users]
	before_filter :check_owner, only:[:edit,:update,:destroy,
		:add_users_form,:add_users,:destroy_users]

	def index
		@systems = System.all
	end

	def show
		@users = []
		@system.users.each do |user|
			if user.id != @system.owner_id
				@users << user
			end
		end
	end

	def new
		@system = System.new
	end

	def create
		@system = System.create(system_params)
		@system.owner_id = @user.id
		@system.system_type = SystemType.find_by_id(params[:system][:system_type])
		@system.save
		@user.system_lists.create(system: @system)
		redirect_to system_path(@system)
	end

	def edit
	end

	def update
		@system.update(system_params)
		@system.system_type = SystemType.find_by_id(params[:system][:system_type])
		@system.save
		redirect_to system_path(@system)
	end

	def destroy
		@system.destroy
		redirect_to user_path(@user)
	end

	def add_users_form
		@users = []
		User.all.each do |user|
			if !@system.users.include?(user)
				@users << user
			end
		end
	end 
		

	def add_users
		ids = params[:user_ids]
		ids.each do |i|
			user = User.find_by_id(i)
			@system.users << user
		end
		redirect_to system_path(@system)
	end

	def destroy_users
		ids = params[:user_ids]
		ids.each do |i|
			user = User.find_by_id(i)
			@system.users.destroy(user)
		end
		redirect_to system_path(@system)
	end

	def leave
		if (  @system.users.include?(@user) && @system.owner_id != @user.id )
			@system.users.destroy(@user)
			redirect_to user_path(@user)
		else
			render_403
		end
	end


private 

	def system_params
				params.require(:system).permit(:name,:description,:details)
	end

	def load_user
		@user = current_user
	end

	def load_system
		@system = System.find_by_id(params[:id])
	end

	def check_owner
		render_403 unless @system.owner_id == current_user.id || current_user.admin?
	end

end

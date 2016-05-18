class UsersController < ApplicationController

  before_filter :signed_in
  before_filter :load_user, only: [:show, :destroy]
  before_filter :check_if_admin, only: [:destroy]

	def index
		@users = User.all
	end

	def show
    @systems = @user.systems.all
  end

  def destroy
  	@user.destroy
  	redirect_to users_path
  end

  private

  def load_user
    @user = User.find_by_id(params[:id])
  end

end

class TasksController < ApplicationController

	before_filter :load_system, only: [:new,:create]

	def new
		@task = @system.tasks.build
	end

	def create
		@task = @system.tasks.new(task_params)
		@task.save
		redirect_to system_path(@system)
	end

	private 

	def load_system
    @system = System.find(params[:system_id])
  end

  def task_params
		params.require(:task).permit(:name)
	end

end

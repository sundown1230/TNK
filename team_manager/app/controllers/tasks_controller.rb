class TasksController < ApplicationController
  before_action :set_project, only: [:new, :create, :destroy, :index, :show]

  def set_project
    @project = Project.find(params[:project_id])
  end
  
  def new
	@task = @project.tasks.build
  end

  def create
    @tasks = @project.tasks.create(task_params)
    redirect_to project_path(@project)
  end

  def index
	@tasks = @project.tasks.all
  end

  def show
    @task = @project.tasks.find(params[:id])
  end

  def destroy
    @report = @project.tasks.find(params[:id])
    @report.destroy
    redirect_to project_path(@project)
  end
 
  private
    def task_params
      params.require(:task).permit(:id, :title, :project_id, :content, :due)
    end
end

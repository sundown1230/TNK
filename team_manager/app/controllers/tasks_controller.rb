class TasksController < ApplicationController
  before_action :set_project, only: [:new, :create, :destroy, :index, :show, :edit]

  def set_project
    @project = Project.find(params[:project_id])
  end
  
  def new
	@task = @project.tasks.build
	@task.tasks_users.build
  end

  def create
    @task = @project.tasks.create(task_params)
	if @task.save
	  redirect_to project_task_path(@project, @task)
	else
	  render 'new'
	end
  end

  def index
	@tasks = @project.tasks.all
  end

  def show
    @task = @project.tasks.find(params[:id])
  end
  
  def update
    @task = @project.tasks.find(params[:id])
	if @task.update(task_params)
	  redirect_to project_task_path(@project, @task)
	else
	  render 'edit'
	end
  end

  def edit
    @task = @project.tasks.find(params[:id])
  end

  def destroy
    @report = @project.tasks.find(params[:id])
    @report.destroy
    redirect_to project_path(@project)
  end
 
  private
    def task_params
      params.require(:task).permit(:id, :title, :project_id, :content, :due, users_attributes: [:id, :name], tasks_users_attributes: [:id, :task_id, :user_id])
    end
end

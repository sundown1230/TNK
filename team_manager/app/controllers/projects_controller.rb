class ProjectsController < ApplicationController
  def new
    @project = Project.new
    4.times { @project.projects_users.build }
  end

  def create
    @project = Project.new(project_params)	
    if @project.save
      redirect_to @project
	else
	  render 'new'
	end
  end

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
	@reports = @project.reports.all
	@tasks = @project.tasks.all
	@members = @project.users.all
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      redirect_to @project
    else
      render 'edit'
    end
  end

  def destroy
    @project = Project.find(params[:id])
	@project.destroy
	redirect_to projects_path
  end

  private
    def project_params
	  params.require(:project).permit(:title, :project_manager_id, :starts_at, :ends_at, :description, :status, users_attributes: [:id, :name], projects_users_attributes: [:id, :project_id, :user_id])
	end
end

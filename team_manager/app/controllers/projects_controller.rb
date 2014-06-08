class ProjectsController < ApplicationController
  def new
  end

  def create
    @project = Project.new(project_params)	
    @project.save
    redirect_to @project
  end

  def index
    @projects = Project.all
  end

  def show
  @project = Project.find(params[:id])
  end

  def list
  end

  private
    def project_params
	  params.require(:project).permit(:title, :project_manager_id, :starts_at, :ends_at, :description, :status)
	end
end

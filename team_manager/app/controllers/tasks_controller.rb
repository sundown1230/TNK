class TasksController < ApplicationController
  def create
    @project = Project.find(params[:project_id])
    @tasks = @project.tasks.create(task_params)
    redirect_to project_path(@project)
  end

  def destroy
    @project = Project.find(params[:project_id])
    @report = @project.tasks.find(params[:id])
    @report.destroy
    redirect_to project_path(@project)
  end
 
  private
    def task_params
      params.require(:task).permit(:title, :project_id, :content, :due)
    end
end

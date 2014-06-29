class ReportsController < ApplicationController
  def create
    @project = Project.find(params[:project_id])
    @report = @project.reports.create(report_params)
    redirect_to project_path(@project)
  end

  def destroy
    @project = Project.find(params[:project_id])
	@report = @project.reports.find(params[:id])
	@report.destroy
	redirect_to project_path(@project)
  end
 
  private
    def report_params
      params.require(:report).permit(:title, :user_id, :text)
    end
end

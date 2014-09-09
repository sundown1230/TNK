class ReportsController < ApplicationController
  def new
    @project = Project.find(params[:project_id])
    @report = @project.reports.build
  end

  def create
    @project = Project.find(params[:project_id])
    @report = @project.reports.create(report_params)
    redirect_to project_path(@project)
  end

  def index
    @project = Project.find(params[:project_id])
    @reports = @project.reports.all
  end

  def show
    @project = Project.find(params[:project_id])
    @report = @project.reports.find(params[:id])
  end

  def edit
    @project = Project.find(params[:project_id])
    @report = @project.reports.find(params[:id])
  end

  def update
    @project = Project.find(params[:project_id])
    @report = @project.reports.find(params[:id])
    if @report.update(report_params)
      redirect_to @report
    else
      render 'edit'
    end
  end
 
  def destroy
    @project = Project.find(params[:project_id])
    @report = @project.reports.find(params[:id])
    @report.destroy
    redirect_to project_path(@project)
  end
 
  private
    def report_params
      params.require(:report).permit(:id, :title, :user_id, :text)
    end
end

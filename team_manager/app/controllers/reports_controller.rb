class ReportsController < ApplicationController
  before_action :set_project, only: [:new, :create, :show, :edit, :update, :destroy, :index]

  def set_project
    @project = Project.find(params[:project_id])
  end

  def new
    @report = @project.reports.build
  end

  def create
    @report = @project.reports.create(report_params)
    redirect_to project_path(@project)
  end

  def index
    @reports = @project.reports.all
  end

  def show
    @report = @project.reports.find(params[:id])
  end

  def edit
    @report = @project.reports.find(params[:id])
  end

  def update
    @report = @project.reports.find(params[:id])
    if @report.update(report_params)
      redirect_to @report
    else
      render 'edit'
    end
  end
 
  def destroy
    @report = @project.reports.find(params[:id])
    @report.destroy
    redirect_to project_path(@project)
  end
 
  private
    def report_params
      params.require(:report).permit(:id, :title, :user_id, :text)
    end
end

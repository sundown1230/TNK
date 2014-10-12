class ReportsController < ApplicationController
  before_action :set_project, only: [:new, :create, :show, :edit, :update, :destroy, :index]

  def set_project
    @project = Project.find(params[:project_id])
  end

  def new
    @report = @project.reports.build
	@report.reports_users.build
  end

  def create
    @report = @project.reports.create(report_params)
	if @report.save
	  redirect_to project_report_path(@project, @report)
	else
	  render 'new'
	end
  end

  def index
    @reports = @project.reports.all
  end

  def show
    @report = @project.reports.find(params[:id])
    @authors = @report.users.all
  end

  def edit
    @report = @project.reports.find(params[:id])
  end

  def update
    @report = @project.reports.find(params[:id])
    if @report.update(report_params)
	  redirect_to project_report_path(@project, @report)
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
      params.require(:report).permit(:id, :title, :user_id, :text, users_attributes: [:id, :name], reports_users_attributes: [:id, :user_id, :report_id])
    end
end

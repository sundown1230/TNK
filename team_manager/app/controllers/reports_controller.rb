class ReportsController < ApplicationController
  before_action :set_project, only: [:new, :create, :show, :edit, :update, :destroy, :index, :users_edit, :user_delete]
  before_action :set_report, only: [:show, :edit, :update, :destroy, :users_edit, :user_delete]

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
  end

  def edit
  end

  def update
    if @report.update(report_params)
	  redirect_to project_report_path(@project, @report)
    else
      render 'edit'
    end
  end
 
  def destroy
    @report.destroy
    redirect_to project_path(@project)
  end

  def users_edit
    @new_user = @report.reports_users.build
	render 'users_edit'
  end
   
  def user_delete
    @report_user = @report.reports_users.where(user_id: params[:user_id], report_id: @report.id).first
    @report_user.destroy
    redirect_to report_users_edit_path(@report.project_id, @report)
  end

  private
    def report_params
      params.require(:report).permit(:id, :title, :user_id, :text, users_attributes: [:id, :name], reports_users_attributes: [:id, :user_id, :report_id])
    end
  
    def set_project
      @project = Project.find(params[:project_id])
    end

    def set_report
      @report = Report.find(params[:id])
    end
end

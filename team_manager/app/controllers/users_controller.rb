class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
	redirect_to projects_path
  end

  def show
    @user = User.find(params[:id])
  end

  private
    def user_params
	  params.require(:user).permit(:id, :name, :email, 
	    material_users_attributes: [:id, :material_id, :user_id],
	    materials_attributes: [:id],
	    reports_attributes: [:id, :title],
	    reports_users_attributes: [:id, :report_id, :user_id], 
	    projects_attributes: [:id, :title, :description],
	    projects_users_attributes: [:id, :project_id, :user_id],
	    tasks_attributes: [:id, :title, :due, :content],
	    tasks_users_attributes: [:id, :task_id, :user_id]
	  )
    end
end

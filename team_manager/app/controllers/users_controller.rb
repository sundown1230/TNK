class UsersController < ApplicationController
  def index
    @users = User.page(params[:page]).per(10)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
	redirect_to projects_path
  end

  def show
    @user = User.find(params[:id])
	@materials = @user.materials.limit(3)
	@projects = @user.projects.limit(3)
	@reports = @user.reports.limit(3)
	@tasks = @user.tasks.limit(3)
	all_tasks = @user.tasks
    gon.tasks = []
    task_num = all_tasks.length
    for i in 0..task_num-1 do
      task = {"title"=> all_tasks[i].title,
              "due"=> all_tasks[i].due,
              "url"=> project_task_path(all_tasks[i].project_id, all_tasks[i].id)
             }
      gon.tasks.push(task)  
	end
  end

  private
    def user_params
	  params.require(:user).permit(:id, :name, :email, 
	    materials_users_attributes: [:id, :material_id, :user_id],
	    materials_attributes: [:id, :title, :description],
	    reports_attributes: [:id, :title],
	    reports_users_attributes: [:id, :report_id, :user_id], 
	    projects_attributes: [:id, :title, :description],
	    projects_users_attributes: [:id, :project_id, :user_id],
	    tasks_attributes: [:id, :title, :due, :content],
	    tasks_users_attributes: [:id, :task_id, :user_id]
	  )
    end
end

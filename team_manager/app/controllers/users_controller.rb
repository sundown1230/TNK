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
	  params.require(:user).permit(:id, :name, :email, {material_users:[:id, :material_id, :user_id]})
  end
end

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
	  params.require(:user).permit(:title, :text, material_attribute: [:title, :title])
  end
end

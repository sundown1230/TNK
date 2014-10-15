class MaterialsController < ApplicationController
  before_action :set_material, only: [:show, :destroy, :edit, :update, :user_edit, :user_delete]
  
  def new
    @material = Material.new
	4.times { @material.materials_users.build }
  end

  def create
    @material = Material.new(material_params)
    if @material.save
      redirect_to @material
	else
	  render 'new'
	end
  end

  def index
    @materials = Material.all
  end

  def show
	@materials_users = @material.users.all
  end

  def edit
  end

  def update
    if @material.update(material_params)
      redirect_to @material
    else
      render 'edit'
    end
  end

  def destroy
	@material.destroy
	redirect_to materials_path
  end
  def users_edit
    @new_member = @material.materials_users.build
    render 'members_edit'
  end

  def user_delete
    @material_user = @material.materials_users.where(user_id: params[:user_id], material_id: @material.id).first
    @material_user.destroy
    redirect_to project_members_edit_path(@material)
  end



  private
    def material_params
	  params.require(:material).permit(:id, :title, :text, users_attributes: [:id, :name], materials_users_attributes: [:id, :user_id, :material_id])
	end

	def set_material
	  @material = Material.find(params[:id])
	end
end

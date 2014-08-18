class MaterialsController < ApplicationController
  def new
    @material = Material.new
	4.times { @material.material_users.build }
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
    @material = Material.find(params[:id])
	@material_users = @material.users.all
  end

  def edit
    @material = Material.find(params[:id])
  end

  def update
    @material = Material.find(params[:id])
    if @material.update(material_params)
      redirect_to @material
    else
      render 'edit'
    end
  end

  def destroy
    @material = Material.find(params[:id])
	@material.destroy
	redirect_to materials_path
  end

  private
    def material_params
	  params.require(:material).permit(:id, :title, :text, users_attributes: [:id, :name], material_users_attributes: [:id, :user_id, :material_id])
	end
end

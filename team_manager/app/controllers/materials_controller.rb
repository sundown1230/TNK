class MaterialsController < ApplicationController
def new
    @material = Material.new
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
	  params.require(:material).permit(:title, :text)
	end
end

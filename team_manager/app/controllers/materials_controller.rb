class MaterialsController < ApplicationController
  def index
  end

  def edit
  end

  def new
  end

  def create
    @material = Material.new(params[:material])
	@material.save
	redirect_to @material
  end

  private
    def material_params
	  params.require(:material).permit(:title, :text)
    end
end

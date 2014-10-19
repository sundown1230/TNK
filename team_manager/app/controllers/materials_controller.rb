class MaterialsController < ApplicationController
  def new
    @material = Material.new
    @material.materials_users.build
  end

  def create
    @material = Material.new(material_params)
    file = params["material"]["content"]
    @material.filename = file.original_filename
    #@material.filetype = File.extname(file.original_filename).slice(1..-1)
    File.open("public/materials/"+@material.filetype+@material.filename, 'wb') { |f|
	  f.write(file.read)
    }
    if @material.save
      redirect_to @material
    else
      render 'new'
    end
  end

  def index
    @materials = Material.all
  end

  def categorized_index
    @materials = Material.where(filetype: params[:filetype])
  end
  
  def show
    @material = Material.find(params[:id])
    @materials_users = @material.users.all
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
    File.delete("public/"+@material.filetype+"/"+@material.filename)
    @material.destroy
    redirect_to materials_path
  end

  private
    def material_params
      params.require(:material).permit(:id, :title, :filename, :filetype, users_attributes: [:id, :name], materials_users_attributes: [:id, :user_id, :material_id])
    end
end

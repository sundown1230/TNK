class MaterialsController < ApplicationController
  before_action :set_material, only: [:show, :destroy, :edit, :update, :users_edit, :user_delete]
  
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
  end

  def update
    if @material.update(material_params)
      redirect_to @material
    else
      render 'edit'
    end
  end

  def destroy
<<<<<<< HEAD
    @material = Material.find(params[:id])
    File.delete("public/"+@material.filetype+"/"+@material.filename)
    @material.destroy
    redirect_to materials_path
=======
	@material.destroy
	redirect_to materials_path
>>>>>>> d2acf33e27478260d8ba10ae9024139ee17eaacc
  end

  def users_edit
    @new_user = @material.materials_users.build
    render 'users_edit'
  end

  def user_delete
    @material_user = @material.materials_users.where(user_id: params[:user_id], material_id: @material.id).first
    @material_user.destroy
    redirect_to material_users_edit_path(@material)
  end



  private
    def material_params
<<<<<<< HEAD
      params.require(:material).permit(:id, :title, :filename, :filetype, users_attributes: [:id, :name], materials_users_attributes: [:id, :user_id, :material_id])
    end
=======
	  params.require(:material).permit(:id, :title, :text, users_attributes: [:id, :name], materials_users_attributes: [:id, :user_id, :material_id])
	end

	def set_material
	  @material = Material.find(params[:id])
	end
>>>>>>> d2acf33e27478260d8ba10ae9024139ee17eaacc
end

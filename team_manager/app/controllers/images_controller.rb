class ImagesController < ApplicationController
  
  #before_action :set_image, only: [:show, :edit, :update, :destroy ]
  def new
    @imageable = find_imageable
    @image = Image.new
  end

  def create
    @imageable = find_imageable
   @image = @imageable.images.new(params[:image])
       
    if @image.save
        redirect_to @image.imageable
    else
        redirect_to @image.imageable
    end
  end
  def index
    @images = Image.all
  end

  def update
    @image = @imageable.images.find(params[:id])
    if @image.update(image_params)
      redirect_to @image.imageable
    else
      render 'edit'
    end
  end
  def destroy
    @image = @imageable.images.find(params[:id])
    @image.destroy
    redirect_to @image.imageable_path
  end
  
  private
    def image_params
      params.require(:image).permit(:image_file, :imageable)
    end
 
    def find_imageable
      params.each do |name, value|
        if name =~ /(.+)_id$/
          return $1.classify.constantize.find(value)
        end
      end
      nil
    end
    def set_image
      @image = Image.find(params[:id])
    end
end


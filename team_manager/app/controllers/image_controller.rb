class ImageController < ApplicationController
  def new
  @image = Image.new
  end
  def create
    @imageable = find_imageable
    @image = @imageable.images.build(params[:image])
       
    if @image.save
        redirect_to accounting_image_path(@imageable, @image), notece: 'suc'
    else
        redirect_to @image.imageable, notice: 'An error occured.'
    end
  end
  def index
    @images = Image.all
  end
  def show
    @image = Image.find(params[:id])
  end
  def edit
    @image = Image.find(params[:id])
  end
  def update
    @image = Image.find(params[:id])
    if @image.update(image_params)
      redirect_to @image.imageable
    else
      render 'edit'
    end
  end
  def destroy
    @image =Image.find(params[:id])
    @image.destroy
    redirect_to @image.imageable_path
  end
  
  private
    def image_params
      params.require(:image).permit(:image_file, :imageable)
    end
  private
    def find_imageable
      params.each do |name, value|
        if name =~ /(.+)_id$/
          return $1.classify.constantize.find(value)
        end
      end
      nil
    end
end


class ImagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_image, only: [:edit, :update, :destroy]

  def index
    @posts = Post.get_images.paginate(page: params[:page], per_page: 10)
  end

  def destroy
    @image = set_image
    @post = Post.find(@image.post_id)
    @image.destroy
    redirect_to @post, notice: 'Image has been deleted.'
  end

  def edit
    @image = set_image
  end

  def update
    @image = set_image
    @post = Post.find(@image.post_id)  
      
    if @image.update(image_params)
      redirect_to @post, notice: 'Image was successfully updated.' 
    else
      render action: 'edit' 
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_params
     if params[:image].present?
      params.require(:image).permit(:file, :post_id)
     end
   end
end
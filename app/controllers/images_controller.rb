class ImagesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_image, only: [:edit, :update, :destroy]

  def index
    @posts = Post.images.paginate(page: params[:page], per_page: 10)
  end

  def destroy
    @post = @image.post
    @image.destroy
    redirect_to @post, notice: 'Image has been deleted.'
  end

  def edit
  end

  def update
    @post = @image.post
      
    if @image.update(image_params)
      redirect_to @post, notice: 'Image was successfully updated.' 
    else
      render action: 'edit' 
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def find_image
      @image = Image.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_params
     if params[:image].present?
      params.require(:image).permit(:file, :post_id)
     end
   end
end
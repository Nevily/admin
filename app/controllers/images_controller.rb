class ImagesController < ApplicationController

  def destroy
    @image = set_image
    @post = Post.find(@image.post_id)
    @image.destroy

    respond_to do |format|
      format.html { redirect_to @post, notice: 'Image has been deleted.' }
      format.js
    end  
  end

  def edit
    @image = set_image
  end

  def update
    @image = set_image
    @post = Post.find(@image.post_id)

    respond_to do |format|
      if @image.update(image_params)
        format.html { redirect_to @post, notice: 'Image was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
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
class PostsController < ApplicationController
  before_action :authenticate_user!

  def show
    @post = set_post
    @post_images = @post.images.all
  end

  def new
     @post = Post.new
     @post_images = @post.images.build
  end

  def create
     @post = Post.new(post_params)

     respond_to do |format|
       if @post.save
         params[:images]['file'].each do |i|
            @post_image = @post.images.create!(file: i, :post_id => @post.id)
         end
         format.html { redirect_to @post, notice: 'Post was successfully created.' }
       else
         format.html { render action: 'new' }
       end
     end
  end

  def update
   respond_to do |format|
      if @post.update(post_params)
        params[:images]['file'].each do |i|
          @post_image = @post.images.create!(file: i, :post_id => @post.id)
        end
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to @post }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :description, :venue, :category_id, images_attributes: [:id, :post_id, :file])
    end
end
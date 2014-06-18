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
        if params[:images]
         params[:images].each do |i|
            @post_image = @post.images.create!(file: i, post_id: @post.id)
         end
        end
         format.html { redirect_to @post, notice: 'Post was successfully created.' }
       else
         format.html { render action: 'new' }
       end
     end
  end

  def edit
    @post = set_post
    @post_images = @post.images.all
  end

  def update
    @post = set_post
    respond_to do |format|
      if @post.update_attributes(post_params)
        if params[:images]
          params[:images].each do |i|
            @post_image = @post.images.create!(file: i, :post_id => @post.id)           
          end
        end
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :ok }
      end
    end
  end

  def destroy
    @post = set_post
    @post.destroy

    respond_to do |format|
      format.html { redirect_to pages_index_path, notice: 'Post was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  def videos
    @videos = Post.where.not(video: nil)
  end

  def show_video

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
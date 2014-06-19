class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def show
    @post = set_post
    @post_images = @post.images.all
    @testimonies = @post.testimonies.all
  end

  def new
     @post = Post.new
  end
  
  def create
     @post = current_user.posts.build(post_params)

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
    @images = @post.images.all
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
      else
        format.html { render action: 'edit' }
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
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :description, :video, :venue, :category_id, images_attributes: [:id, :post_id, :file], testimonies_attributes: [:id, :author, :content])
    end
end
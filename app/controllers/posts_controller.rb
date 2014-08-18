class PostsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_post, only: [:show, :edit, :update, :destroy]  

  def show
    @post = set_post
    @images = @post.images
    @testimonies = @post.testimonies
  end

  def new
     @post = Post.new
  end
  
  def create
    @post = current_user.posts.build(post_params)

    begin
      Post.transaction do
        @post.save!
        if params[:images]
          params[:images].each do |image_file|
            @image = @post.images.create!(file: image_file, post_id: @post.id)
          end
        end
      end
      redirect_to @post, notice: 'Post was successfully created.'
    rescue ActiveRecord::RecordInvalid
      render action: 'new', status: :unprocessable_entity
    end
  end

  def edit
    @post = set_post
    @images = @post.images
  end

  def update
    @post = set_post    
    if @post.update_attributes(post_params)
      if params[:images]
        params[:images].each do |image|
          @image = @post.images.create!(file: image, :post_id => @post.id)           
        end
      end
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @post = set_post
    @post.destroy

    redirect_to pages_index_path, notice: 'Post was successfully deleted.'
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
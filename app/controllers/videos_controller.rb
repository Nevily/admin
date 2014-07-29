class VideosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:show]
  
  def index
    @posts = Post.get_videos.paginate(page: params[:page], per_page: 10)
  end

  def show
    @post = set_post
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end
end
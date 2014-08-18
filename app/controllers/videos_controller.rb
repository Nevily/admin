class VideosController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post, only: [:show]
  
  def index
    @posts = Post.videos.paginate(page: params[:page], per_page: 10)
  end

  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def find_post
      @post = Post.find(params[:id])
    end
end
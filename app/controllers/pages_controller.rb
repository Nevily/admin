class PagesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @post = Post.paginate(page: params[:page])
  end
end

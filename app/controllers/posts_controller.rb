class PostsController < ApplicationController
  def index
    @posts = Post.preload([:user, :likes]).page(params[:page]).per(5).order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
  end
end

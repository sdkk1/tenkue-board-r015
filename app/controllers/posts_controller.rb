class PostsController < ApplicationController
  def index
    @posts = Post.preload(:user).page(params[:page]).per(5).order(created_at: :desc)
  end

  def show
    @post = Post.preload(:comments).find(params[:id])
  end
end

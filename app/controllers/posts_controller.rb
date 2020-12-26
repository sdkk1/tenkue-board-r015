class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    @posts = Post.preload(:user).page(params[:page]).per(5).order(created_at: :desc)
  end

  def new
    @post = Post.new
  end
end

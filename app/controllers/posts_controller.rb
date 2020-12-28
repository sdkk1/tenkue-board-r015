class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    @posts = Post.preload(:user).page(params[:page]).per(5).order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.save ? (redirect_to root_path) : (render 'new')
  end

  private
  def post_params
    params.require(:post).permit(:content).merge(user_id: current_user.id)
  end 
  
end

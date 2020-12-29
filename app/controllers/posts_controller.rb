class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :post_owner_confirmation, only: [:edit, :update, :destroy]

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

  def edit
  end

  def update
    @post.update(post_params) ? (redirect_to @post) : (render 'edit')
  end

  def destroy
    @post.destroy
    redirect_back(fallback_location: root_path)
  end

  private
  def post_params
    params.require(:post).permit(:content).merge(user_id: current_user.id)
  end

  def post_owner_confirmation
    post = Post.find(params[:id])
    current_user.posts.include?(post) ? @post = post : (redirect_to root_path)
  end
  
end

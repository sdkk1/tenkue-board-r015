class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    @posts = Post.preload(:user).page(params[:page]).per(5).order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(content: post_params[:text], user_id: current_user.id)
    if @post.save
      flash[:success] = '投稿に成功しました'
      redirect_to root_path
    else
      flash[:alert] = '投稿に失敗しました'
      render 'new'
    end
  end

  private
  def post_params
    params.require(:post).permit(:text)
  end
end

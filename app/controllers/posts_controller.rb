class PostsController < ApplicationController
  def index
    @posts = Post.order(created_at: :desc).preload(:user)
  end
end

class PostsController < ApplicationController
  def index
    @posts = Post.all.preload(:user)
  end
end

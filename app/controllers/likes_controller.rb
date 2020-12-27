class LikesController < ApplicationController
  def create
    current_user.likes.create(post_id: params[:id])
  end

  def destroy
    @like = current_user.likes.find_by(post_id: params[:id])
    @like.destroy
  end
end

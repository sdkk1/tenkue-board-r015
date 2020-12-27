class LikesController < ApplicationController
  def create
    current_user.likes.create(post_id: params[:id])
  end

  def destroy

  end
end

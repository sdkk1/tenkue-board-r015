class LikesController < ApplicationController

  def create
    current_user.likes.create(post_id: params[:post_id])
    redirect_current_page
  end

  def destroy
    @like = current_user.likes.find_by(post_id: params[:post_id])
    @like.destroy
    redirect_current_page
  end

  private

  def redirect_current_page
    redirect_to request.referer
  end
end

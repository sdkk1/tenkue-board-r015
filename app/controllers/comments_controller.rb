class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
      flash[:alert] = "コメントを(140文字以内で)入力してください"
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:comment, :post_id, :user_id)
    end
end

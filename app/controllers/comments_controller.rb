class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:notice] = "コメントを投稿しました！"
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = "コメントを(140文字以内で)入力してください。"
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      flash[:notice] = "コメントを削除しました！"
      redirect_back(fallback_location: root_path)
    end
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comments = @post.comments.eager_load(:user).order(created_at: :desc)
    render "posts/show"
  end

  def update
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      flash[:notice] = "コメントを更新しました！"
      redirect_to post_url(@post)
    else
      flash[:alert] = "コメントを(140文字以内で)入力してください。"
      redirect_back(fallback_location: root_path)
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:comment, :post_id, :user_id)
    end
end

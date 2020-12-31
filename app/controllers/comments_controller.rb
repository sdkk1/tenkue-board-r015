class CommentsController < ApplicationController
  before_action :set_post, only: [:create, :edit, :update, :destroy]
  before_action :set_comment, only: [:destroy, :edit, :update, :correct_user]
  before_action :set_comments, only: [:create, :edit, :update]
  before_action :correct_user, only: [:destory, :edit, :update]

  def create
    @comment = @post.comments.build(comment_params)
    if @comment.save
      flash[:notice] = "コメントを投稿しました！"
      redirect_to post_path(@post.id)
    else
      flash.now[:alert] = "コメントを(140文字以内で)入力してください。"
      render 'posts/show'
    end
  end

  def destroy
    if @comment.destroy
      flash[:notice] = "コメントを削除しました！"
      redirect_to post_path(@post.id)
    end
  end

  def edit
    render "posts/show"
  end

  def update
    if @comment.update(comment_params)
      flash[:notice] = "コメントを更新しました！"
      redirect_to post_path(@post.id)
    else
      flash.now[:alert] = "コメントを(140文字以内で)入力してください。"
      render 'posts/show'
    end
  end

  private

    def set_post
      @post = Post.find(params[:post_id])
    end

    def set_comment
      @comment = Comment.find(params[:id])
    end

    def set_comments
      @comments = @post.comments.eager_load(:user).order(created_at: :desc)
    end

    def correct_user
      unless @comment.user_id == current_user.id
        flash[:alert] = "コメントの投稿者のみ編集できます。"
        redirect_to root_url
      end
    end

    def comment_params
      params.require(:comment).permit(:comment, :post_id, :user_id).merge(user_id: current_user.id)
    end
end

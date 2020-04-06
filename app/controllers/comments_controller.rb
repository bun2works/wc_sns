class CommentsController < ApplicationController
  def create
    @comment = current_team.comments.new(comment_params)
    if @comment.save
      redirect_to posts_path, notice: "レスポンスを投稿しました。"
    else
      @posts = Post.order(updated_at: :desc)
      render template: "posts/index"
    end
  end
end

def destroy
  @comment = Comment.find(params[:id])
  @comment.destroy
  redirect_to posts_path, notice: "レスポンスを削除しました。"
end

private

def comment_params
  params.require(:comment).permit(:response, :post_id)
end
class CommentsController < ApplicationController
  def create
    @post = Post.new
    @comment = current_team.comments.new(comment_params)
    if @comment.save
      redirect_to posts_path, notice: "投稿しました。"
    else
      render template: "posts/index"
    end
  end
end

def destroy
  @comment = Comment.find(params[:id])
  @comment.destroy
  redirect_to posts_path, notice: "投稿を削除しました。"
end

private

def comment_params
  params.require(:comment).permit(:response, :post_id)
end

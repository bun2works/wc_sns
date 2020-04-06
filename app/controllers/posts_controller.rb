class PostsController < ApplicationController
  before_action :authenticate_team!
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.order(updated_at: :desc)
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_team.posts.new(post_params)
    if @post.save
      redirect_to @post, notice: "スレッドを作成しました"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: "スレッドを更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: "スレッドを削除しました。"
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end


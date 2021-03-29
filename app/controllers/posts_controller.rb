class PostsController < ApplicationController
  def index
    @posts =Post.all.page(params[:page])
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post, notice: "「#{@post.content}」を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_url, notice: "投稿を削除しました。"
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post, notice: "「#{@post.content}」を投稿しました。"
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end

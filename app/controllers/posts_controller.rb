class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create 
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
      flash[:notice] = "スケジュールを登録しました"
    else
      render "new"
      flash[:alert] = "スケジュールを登録できませんでした"
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path
      flash[:notice] = "スケジュールを更新しました"
    else
      render "edit"
      flash[:alert] = "スケジュールを更新できませんでした"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "スケジュールを削除しました"
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :start, :finish, :all_day, :memo)
  end

end
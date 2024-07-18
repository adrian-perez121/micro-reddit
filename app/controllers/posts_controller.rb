class PostsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @post = @user.posts.build
  end

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(params[:user_id])

  end

  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.build(post_params)

    if @post.save
      redirect_to @user
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to @user
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end

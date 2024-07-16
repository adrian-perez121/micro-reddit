class PostsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @post = @user.posts.build
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

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end

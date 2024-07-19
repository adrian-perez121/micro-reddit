class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user = @post.user

    if @comment.save
      redirect_to user_post_path(@post.user, @post), notice: 'Comment was successfully created.'
    else
      Rails.logger.debug(@comment.errors.full_messages)
      redirect_to user_post_path(@post.user, @post), alert: 'Failed to create comment.'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

end

class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id].to_i)
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to @post
    else
      redirect_to @post
    end
  end

  def destroy
    @post = Post.find(params[:post_id].to_i)
    @comment = Comment.find(params[:id].to_i)

    if @comment.destroy
      redirect_to @post
    else
      redirect_to @post
    end
  end

  def edit
    @post = Post.find(params[:post_id].to_i)
    @comment = Comment.find(params[:id].to_i)
  end

  def update
    @post = Post.find(params[:post_id].to_i)
    @comment = Comment.find(params[:id].to_i)
    
    if @comment.update(comment_params)
      redirect_to @post
    else
      redirect_to @post
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end

class CommentsController < ApplicationController
  def index
    @comments = Comment.all
    @user = User.find_by(params[:id])
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def edit
  end

  def destroy
  end

  def update
  end

  def create
    @comment = Comment.new(comment_params)
    @user = User.find_by(params[:id])

    if @comment.save
      flash[:info] = "Comment was posted successfully"
      redirect_to posts_path
    else
      flash[:error] = "something went wrong!"
      redirect_to new_comment_path
    end
  end

  def new
    @comment = Comment.new(comment_params)
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id, :post_id)
  end
end

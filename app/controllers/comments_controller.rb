class CommentsController < ApplicationController
  def index
    @comments = Commment.all
  end

  def show
    @comment = Commment.find(params[:id])
  end

  def edit
  end

  def destroy
  end

  def update
  end

  def create
    @comment = Commment.new(comment_params)

    if comment.save
      flash[:info] = "Comment was posted successfully"
      redirect_to comment_path(post.id)
    else
      flash[:error] = "something went wrong!"
      redirect_to new_comment_path
    end
  end

  def new
    @comment = Comment.new
  end
end

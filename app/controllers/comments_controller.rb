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
    @comment = Comment.new(comment_params)
    @game = Post.find(@comment.post_id).game_id

    if @comment.save
      flash[:info] = "Comment was posted successfully"
      redirect_to game_path(@game)
    else
      flash[:error] = "something went wrong!"
      redirect_to new_comment_path
    end
  end

  def new
    @comment = Comment.new
  end

  private

    def comment_params
      params.require(:comment).permit(:content, :user_id, :post_id)
    end
end

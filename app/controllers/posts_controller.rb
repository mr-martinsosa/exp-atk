class PostsController < ApplicationController
  def index
    @posts = Post.all
    @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, extensions = {})

    @comments = Comment.all
    @comment = Comment.new
    @user = User.find_by(params[:id])
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
  end

  def destroy
  end

  def update
  end

  def create
    @post = Post.new(post_params)
    @user = User.find_by(params[:id])
    @comment = Comment.new(comment_params)

    if @post.save
      flash[:info] = "post submitted"
      redirect_to posts_path
    else
      flash[:error] = "something went wrong"
      redirect_to new_post_path
    end
  end

  def new
    @post = Post.new
    # @user = current_user
  end

  private

    def post_params
      params.require(:post).permit(:title, :content, :user_id)
    end

    def comment_params
      params.permit(:content, :user_id, :post_id)
    end
end

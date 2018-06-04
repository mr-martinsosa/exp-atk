class PostsController < ApplicationController
  def index
    @posts = Post.all
    @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, extensions = {})
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
    @user = current_user
    @game = @post.game_id

    if @post.save
      flash[:info] = "post submitted"
      redirect_to game_path(@game)
    else
      flash[:error] = "Something went wrong, please try again"
      redirect_to new_post_path
    end
  end

  def new
    @post = Post.new
    # @user = current_user
  end

  private

    def post_params
      params.require(:post).permit(:title, :content, :user_id, :game_id)
    end
end

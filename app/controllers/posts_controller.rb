class PostsController < ApplicationController
  def index
    @posts = Post.all
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

    # if @post.save
    #   flash[:info] = "post submitted"
    #   redirect_to post_path(post.id)
    # else
    #   flash[:error] = "something went wrong"
    #   redirect_to new_post_path
    # end
  end

  def new
    @post = Post.new
    @user = current_user
  end

  private

    def post_params
      params.require(:post).permit(:title, :content, :user_id)
    end
end

class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, extensions = {})
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
  end

  def update
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:info] = "User created"
      redirect_to user_path(user.id)
    else
      flash[:error] = "something went wrong"
      redirect_to new_user_path
    end
  end

  def new
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :username, :password, :email, :birthday)
    end
end

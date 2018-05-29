class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
  end

  def update
  end

  def create
    user = User.new(user_params)

    if user.save
      flash[:info] = "User created"
      redirect_to user_path(user.id)
    else
      flash[:error] = "something went wrong"
      redirect_to new_user_path
    end
  end

  def new
  end
end

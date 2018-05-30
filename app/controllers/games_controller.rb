class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
  end

  def edit
    @game = Game.find(params[:id])
  end

  def destroy
  end

  def update
    @game = Game.find(params[:id])
  end

  def create
    @game = Game.new(game_params)

    if @game.save
      flash[:info] = "successful"
      redirect_to game_path(game.id)
    else
      flash[:error] = "failed"
      redirect_to new_game_path
    end
  end

  def new
    @game = Game.new
  end

  private

  def game_params
    params.require(:game).permit(:name)
  end
end

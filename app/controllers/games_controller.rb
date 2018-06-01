class GamesController < ApplicationController
  def index
    # @game = Game.all
    client = Twitch::Client.new client_id: "#{ENV["TWITCH_CLIENT"]}"
    @top_games = client.get_top_games.data
    # @games = client.get_games({name: ["Super Mario Odyssey","Fortnite","Naruto Shippuden: Ultimate Ninja Storm 4","Destiny 2"]}).data
    
    # search for game, if exists go to page otherwise create
    # @game = if params[:term]
    #   Game.where("name = #{:term}")
    # else
    #   Game.all
    # end
    # games = Game.search(game_params)
    # games.each do |game|
    #   p game
    # end
  end

  def show
    @game = Game.find(params[:id])
    @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, extensions = {})
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
      redirect_to game_path(@game.id)
    else
      flash[:error] = "failed"
      redirect_to new_game_path
    end
  end

  def new
    @game = Game.new
  end

  def result
    @game = params[:name]
  end

  private

  def game_params
    params.permit(:name)
  end
end

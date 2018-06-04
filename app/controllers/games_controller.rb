class GamesController < ApplicationController
  def index
    client = Twitch::Client.new client_id: "#{ENV["TWITCH_CLIENT"]}"
    @top_games = client.get_top_games.data
    @top_games_id = []
    @top_games.each do |top_game|
      @top_games_id.push(Game.where(:name =>"#{top_game.name}").first_or_create(:box_art_url => "#{top_game.box_art_url}"))
    end
  end

  def show
    @game = Game.find(params[:id])
    @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, extensions = {})
    @post = Post.new
    @posts = @game.posts
    @comment = Comment.new
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
    client = Twitch::Client.new client_id: "#{ENV["TWITCH_CLIENT"]}"
    game = client.get_games({name: ["#{params[:name]}"]}).data
    game.each do |game|
      @game = Game.create(name: game.name, box_art_url: game.box_art_url)
    end

    if @game.save
      flash[:info] = "successful"
      redirect_to game_path(@game.id)
    else
      flash[:error] = "failed"
      redirect_to games_path
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

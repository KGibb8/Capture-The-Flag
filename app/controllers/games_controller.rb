class GamesController < ApplicationController

  def home

  end

  def index
    @games = Game.all
    @game = Game.new
    @users = User.all
  end

  def create
    my_games_params = games_params.to_h
    # my_games_params = my_games_params.merge(creator: current_user.id)
    game = Game.new(my_games_params)
    flash[:notice] = "#{game.name} created successfully!" if game.save
    render json: game
  end

  def show
    @game = Game.find(params[:id])
    # @players = @game.sessions
  end

  def games_params
    params.require(:game).permit(:lat, :lng, :name, :description, :start_time, {pictures: []})
  end
end

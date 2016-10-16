class GamesController < ApplicationController
  include GamesHelper

  def home
    
  end

  def index
    @games = Game.all
    @game = Game.new
    @users = User.all
    @past_games = Game.where("id IN (SELECT id FROM games AS g WHERE g.end_time <= NOW() )")
    # @past_games = @games.select { |game| game.end_time <= Time.now }
    @upcoming_games = Game.where("id IN (SELECT id FROM games AS g WHERE g.end_time >= NOW() )")
    # @upcoming_games = @games.select { |game| game.end_time >= Time.now }
    @todays_games = Game.where("id IN (SELECT id FROM games AS g WHERE g.start_time >= CURRENT_DATE() AND g.start_time <= CURRENT_DATE() + 1 )")
    unless current_user.nil?
      @my_past_games = current_user.games.select {|game| game.end_time <= Time.now} unless current_user.nil?
      @my_upcoming_games = current_user.games.select {|game| game.end_time >= Time.now} unless current_user.nil?
    end
  end

  def create
    my_games_params = games_params.to_h
    my_games_params = my_games_params.merge(creator: current_user)
    game = Game.new(my_games_params)
    flash[:notice] = "#{game.name} created successfully!" if game.save
    if remotipart_submitted?
      # TODO : Remotipart now works, but we're getting a No Content in response
      render json: game
    end
  end

  def show
    @game = Game.find(params[:id])
    # @players = @game.sessions
  end

  def games_params
    params.require(:game).permit(:lat, :lng, :name, :description, :start_time, :end_time, {pictures: []})
  end
end

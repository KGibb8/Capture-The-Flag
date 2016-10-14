class GamesController < ApplicationController

  def home

  end

  def index
    @games = Game.all
    @game = Game.new
    @users = User.all
    # @past_games = Game.where("id IN (SELECT * FROM games AS g WHERE g.end_time <= GETDATE() );")
    @past_games = @games.select { |game| game.end_time <= Time.now }
    # @upcoming_games = Game.where("id IN (SELECT * FROM games AS g WHERE g.end_time >= GETDATE() );")
    @upcoming_games = @games.select { |game| game.end_time >= Time.now }
    @todays_games = Game.where("id IN (SELECT * FROM games AS g WHERE g.start_time = CURDATE() );")
    @my_past_games = current_user.games.select {|game| game.end_time <= Time.now} unless current_user.nil?
    @my_upcoming_games = current_user.games.select {|game| game.end_time >= Time.now} unless current_user.nil?
    binding.pry
  end

  def create
    binding.pry
    my_games_params = games_params.to_h
    # my_games_params = my_games_params.merge(creator: current_user.id)
    game = Game.new(my_games_params)
    flash[:notice] = "#{game.name} created successfully!" if game.save
    render json: game.to_json
  end

  def show
    @game = Game.find(params[:id])
    # @players = @game.sessions
  end

  def games_params
    params.require(:game).permit(:lat, :lng, :name, :description, :start_time, :end_time, {pictures: []})
  end
end

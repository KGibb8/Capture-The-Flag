class UserGamesController < ApplicationController

  def create
    my_user_game_params = user_game_params.to_h
    my_user_game_params.merge!(user_id: current_user.id)
    user_game = UserGame.new(my_user_game_params)
    binding.pry
    if user_game.save
      render json: "#{current_user} is attending #{user_game.game.name} on #{user_game.game.start_time}."
    else
      render json: user_game.errors.messages[:duplicate]
    end
  end

  def destroy

  end

  private

  def user_game_params
    params.required(:user_game).permit(:is_present, :review, :lat, :lng, :user_id, :game_id)
  end
end

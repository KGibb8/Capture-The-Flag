class UserGame < ApplicationRecord
  belongs_to :user
  belongs_to :game

  validate :duplicate_session

  private

  def duplicate_session
    if self.user.games.map(&:id).include? self.game_id
      self.errors.add(:duplicate, "You are already registered to attend this game")
    end
  end
end

require './app/uploaders/picture_uploader'

class Game < ApplicationRecord
  has_many :user_games
  has_many :users, through: :user_games
  belongs_to :creator, class_name: "User", inverse_of: :created_games
  
  mount_uploaders :pictures, PictureUploader

  validate :has_creator
  validate :missing_lat
  validate :missing_lng

  private

  def has_creator
    if self.creator.nil?
      self.errors.add(:creator, "A game must have a registered creator")
    end
  end

  def missing_lng
    if self.lng.nil?
      self.errors.add(:missing_longitude, "A game must have a longitude")
    end
  end

  def missing_lat
    if self.lat.nil?
      self.errors.add(:missing_latitude, "A game must have a latitude")
    end
  end

end

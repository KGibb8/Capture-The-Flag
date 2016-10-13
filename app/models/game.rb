require './app/uploaders/picture_uploader'

class Game < ApplicationRecord
  has_many :sessions
  has_many :users, through: :sessions
  mount_uploaders :pictures, PictureUploader
  # belongs_to :creator
end

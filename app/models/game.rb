require './app/uploaders/picture_uploader'

class Game < ApplicationRecord
  mount_uploaders :pictures, PictureUploader
  # belongs_to :creator
end

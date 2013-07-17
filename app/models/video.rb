class Video < ActiveRecord::Base
  attr_accessible :name, :description, :mp4, :oog
  has_attached_file :mp4
  has_attached_file :oog

end

class Zone < ActiveRecord::Base
  attr_accessible :video_id, :sound_clip_id, :rank
  belongs_to :video
  belongs_to :sound_clip
  delegate :mp4, :ogg, :poster, to: :video
  delegate :wav, to: :sound_clip
end

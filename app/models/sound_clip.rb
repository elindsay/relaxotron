class SoundClip < ActiveRecord::Base
  has_attached_file :wav_file
end

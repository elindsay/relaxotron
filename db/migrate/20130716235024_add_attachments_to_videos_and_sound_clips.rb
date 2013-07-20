class AddAttachmentsToVideosAndSoundClips < ActiveRecord::Migration
  def up
    add_attachment :videos, :mp4
    add_attachment :videos, :ogg
    add_attachment :sound_clips, :wav
  end

  def down
    remove_attachment :videos, :mp4
    remove_attachment :videos, :ogg
    remove_attachment :sound_clips, :wav
  end
end

class AddAttachmentsToVideosAndSoundClips < ActiveRecord::Migration
  def up
    add_attachment :videos, :mp4
    add_attachment :videos, :oog
    add_attachment :sound_clips, :wav
  end

  def down
    remove_attachment :videos, :mp4
    remove_attachment :videos, :oog
    remove_attachment :sound_clips, :wav
  end
end

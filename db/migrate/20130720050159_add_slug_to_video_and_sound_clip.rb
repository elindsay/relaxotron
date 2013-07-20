class AddSlugToVideoAndSoundClip < ActiveRecord::Migration
  def change
    add_column :videos, :slug, :string
    add_column :sound_clips, :slug, :string
  end
end

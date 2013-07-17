class CreateSoundClips < ActiveRecord::Migration
  def up
    create_table :sound_clips do |t|
      t.string :name
      t.text :description

      t.timestamps
    end

  end

  def down
    drop_table :sound_clips
  end
end

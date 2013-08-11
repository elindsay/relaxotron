class CreateZones < ActiveRecord::Migration
  def up
    create_table :zones do |t|
      t.references :video
      t.references :sound_clip

      t.timestamps
    end
  end

  def down
    drop_table :zones
  end
end

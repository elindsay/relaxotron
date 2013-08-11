class AddPosterImageToVideos < ActiveRecord::Migration
  def up
    add_attachment :videos, :poster
  end

  def down
    remove_attachment :videos, :poster
  end
end

class AddAttachmentToArticlePictures < ActiveRecord::Migration
  def up
    add_attachment :article_pictures, :image
  end

  def down
    remove_attachment :article_pictures, :image
  end
end

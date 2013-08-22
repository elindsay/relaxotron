class ArticlePicture < ActiveRecord::Migration
  def up
    create_table :article_pictures do |t|
      t.belongs_to :article

      t.timestamps
    end
  end

  def down
    drop_table :article_pictures
  end
end

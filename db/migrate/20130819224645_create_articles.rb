class CreateArticles < ActiveRecord::Migration
  def up
    create_table :articles do |t|
      t.string :title
      t.text :description
      t.boolean :internal_article
      t.text :full_body
      t.string :link

      t.timestamps
    end
  end

  def down
    drop_table :articles
  end
end

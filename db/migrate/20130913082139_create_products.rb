class CreateProducts < ActiveRecord::Migration
  def up
    create_table :products do |t|
      t.string :name
      t.string :description
      t.integer :price_in_cents
      t.integer :stock_count
    end
  end

  def down
    drop_table :products
  end
end

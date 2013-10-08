class CreateSales < ActiveRecord::Migration
  def up
    create_table :sales do |t|
      t.references :product
      t.string :name
      t.string :street
      t.string :city
      t.string :state
      t.string :zip
    end
  end

  def down
    drop_tabe :sales
  end
end

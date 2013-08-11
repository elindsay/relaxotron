class AddRankToZone < ActiveRecord::Migration
  def change
    add_column :zones, :rank, :integer
  end
end

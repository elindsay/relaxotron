class Sale < ActiveRecord::Base
  attr_accessible :name, :street, :city, :state, :zip, :product_id, :total_in_cents

  belongs_to :product
end

class Sale < ActiveRecord::Base
  attr_accessible :name, :street, :city, :state, :zip, :product_id

  belongs_to :product
end

class Product < ActiveRecord::Base
  attr_accessible :name, :description, :price_in_cents, :stock_count, :image, :image_file_name
  has_attached_file :image

  validates_attachment_presence :image
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/jpg', 'image/png']

  def price_in_dollars
    price_in_cents/100.0
  end

end

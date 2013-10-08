class Product < ActiveRecord::Base
  attr_accessible :name, :description, :price_in_cents, :stock_count, :sale_count, :image, :image_file_name
  has_attached_file :image
  has_many :sales

  validates_attachment_presence :image
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/jpg', 'image/png']

  validates :stock_count, presence: true, numericality: true

  def price_in_dollars
    price_in_cents/100.0
  end

  def sale_count
    sales.count
  end

  def sale_callback(user_info)
    self.stock_count -= 1
    self.sales.create(user_info)
    self.save
    ApplicationMailer.product_sale(self, user_info).deliver
  end

end

class ArticlePicture < ActiveRecord::Base
  attr_accessible :image, :article_id, :image_file_name
  has_attached_file :image
  belongs_to :article

  validates_attachment_presence :image
  validates_uniqueness_of :article_id
end

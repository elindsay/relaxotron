class Article < ActiveRecord::Base
  attr_accessible :title, :description, :internal_article, :full_body, :link, :author
  validates :title, presence: :true
  validates :description, presence: :true
  validate :internal_external_ok?
  has_one :article_picture
  
  private
  
  def internal_external_ok?
    if self.internal_article? 
      errors.add(:full_body, "needed for internal article") if self.full_body.blank?
    else
      errors.add(:link, "needed for external article") if self.link.blank?
    end
  end
end

class Video < ActiveRecord::Base
  attr_accessible :name, :description, :mp4, :ogg
  has_attached_file :mp4
  has_attached_file :ogg
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :slug, presence: true, uniqueness: true
  before_validation { |video| video.slug = video.name.downcase.split(" ").join("_") }

  validates_attachment_presence :mp4
  validates_attachment_presence :ogg
  validates_attachment_content_type :mp4, content_type: ['video/mp4', 'video/m4v']
  validates_attachment_content_type :ogg, content_type: ['video/ogg', 'video/ogv']

  def previous_video
    self.class.first(conditions: ["slug < ?", slug], order: "slug desc") || self.class.first(order: "slug desc")
  end

  def next_video
    self.class.first(conditions: ["slug > ?", slug], order: "slug asc") || self.class.first(order: "slug asc")
  end
  
end

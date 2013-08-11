class Video < ActiveRecord::Base
  attr_accessible :name, :description, :mp4, :ogg, :poster, :mp4_file_name, :ogg_file_name, :poster_file_name
  has_attached_file :mp4
  has_attached_file :ogg
  has_attached_file :poster
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :slug, presence: true, uniqueness: true
  before_validation { |video| video.slug = video.name.downcase.split(" ").join("_") }

  validates_attachment_presence :mp4
  validates_attachment_presence :ogg
  validates_attachment_presence :poster
  validates_attachment_content_type :mp4, content_type: ['video/mp4', 'video/m4v']
  validates_attachment_content_type :ogg, content_type: ['video/ogg', 'video/ogv']
  validates_attachment_content_type :poster, :content_type => ['image/jpeg', 'image/jpg', 'image/png']

  def previous_video
    self.class.first(conditions: ["slug < ?", slug], order: "slug desc") || self.class.first(order: "slug desc")
  end

  def next_video
    self.class.first(conditions: ["slug > ?", slug], order: "slug asc") || self.class.first(order: "slug asc")
  end
  
end

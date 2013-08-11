class SoundClip < ActiveRecord::Base
  attr_accessible :name, :description, :wav, :wav_file_name
  has_attached_file :wav
  has_many :zones
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :slug, presence: true, uniqueness: true
  before_validation { |sound_clip| sound_clip.slug = sound_clip.name.downcase.split(" ").join("_") }
  validates_attachment_presence :wav
  validates_attachment_content_type :wav, content_type: ['audio/wav']

  def previous_sound_clip
    self.class.first(conditions: ["slug < ?", slug], order: "slug desc") || self.class.first(order: "slug desc")
  end

  def next_sound_clip
    self.class.first(conditions: ["slug > ?", slug], order: "slug asc") || self.class.first(order: "slug asc")
  end
end

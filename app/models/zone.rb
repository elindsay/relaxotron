class Zone < ActiveRecord::Base
  attr_accessible :video_id, :sound_clip_id, :rank
  belongs_to :video
  belongs_to :sound_clip
  delegate :mp4, :ogg, :poster, to: :video
  delegate :wav, to: :sound_clip
  validate :only_one_ranked_video?

  def video_slug
    video.slug
  end
  
  def sound_clip_slug
    sound_clip.slug
  end

  private

  def only_one_ranked_video?
    unless self.rank.nil?
      if Zone.where('rank IS NOT NULL').find_all_by_video_id(self.video_id).count > 0
        errors.add(:rank, "must not be set if another zone exists with same video")
      end
    end
  end
end

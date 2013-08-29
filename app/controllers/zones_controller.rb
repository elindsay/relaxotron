class ZonesController < ApplicationController
  before_filter :authenticate, only: [:edit]
  layout 'barebones', only: [:show]

  def index
    @zones = Zone.find(:all, order: "rank asc", conditions: "rank IS NOT NULL")
    @initial_zone = @zones.first
  end

  def show
    @video = Video.find_by_slug(params[:video_slug])
    @sound_clip = SoundClip.find_by_slug(params[:audio_slug])
  end

  def edit
  end
end

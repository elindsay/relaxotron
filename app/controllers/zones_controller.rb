class ZonesController < ApplicationController
  before_filter :authenticate, only: [:edit]
  layout 'barebones', only: [:show]

  def index
    @zones = Zone.find(:all, order: "rank asc", conditions: "rank IS NOT NULL")
    @initial_video = Video.find_by_slug(params[:video]) || @zones.first.video
    @initial_audio = SoundClip.find_by_slug(params[:audio]) || @zones.first.sound_clip
    @paused = params[:paused]
  end

  def show
    @video = Video.find_by_slug(params[:video_slug])
    @sound_clip = SoundClip.find_by_slug(params[:audio_slug])
  end

  def edit
  end
end

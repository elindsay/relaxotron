class ZonesController < ApplicationController
  before_filter :authenticate, only: [:edit]

  def index
  end

  def show
    @video = Video.find_by_slug(params[:video_slug])
    @sound_clip = SoundClip.find_by_slug(params[:audio_slug])
  end

  def edit
  end
end

class Admin::SoundClipsController < AdminController

  def new 
    @sound_clip = SoundClip.new
  end

  def create
    @sound_clip = SoundClip.new(params[:sound_clip])
    if @sound_clip.save
      redirect_to admin_sound_clips_path
    else
      render :new
    end
  end

  def index
    @sound_clips = SoundClip.all
  end

  def show
    @sound_clip = SoundClip.find_by_slug(params[:id])
  end
end
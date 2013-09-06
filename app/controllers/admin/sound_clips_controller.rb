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

  def edit 
    @sound_clip = SoundClip.find(params[:id])
  end

  def update
    @sound_clip = SoundClip.find(params[:id])
    if @sound_clip.update_attributes(params[:sound_clip])
      redirect_to admin_sound_clip_path(params[:id])
    else
      render :edit
    end
  end

  def index
    @sound_clips = SoundClip.all
  end

  def show
    @sound_clip = SoundClip.find_by_slug(params[:id])
  end

  def destroy
    SoundClip.find(params[:id]).delete
    redirect_to admin_sound_clips_path, notice: "Sound clip deleted"
  end
end

class Admin::ZonesController < AdminController
  def index
    @zones = Zone.find(:all, order: "rank asc")
  end

  def new
    @zone = Zone.new
    @videos = Video.all
    @sound_clips = SoundClip.all
  end

  def create
    @zone = Zone.new(params[:zone])
    if @zone.save
      redirect_to admin_zones_path
    else
      render :new
    end
  end

  def edit
    @zone = Zone.find(params[:id])
    @videos = Video.all
    @sound_clips = SoundClip.all
  end

  def update
    @zone = Zone.find(params[:id])
    @zone.update_attributes(params[:zone])
    if @zone.save
      redirect_to admin_zones_path
    else
      render :edit
    end
  end

  def destroy
    Zone.find(params[:id]).delete
    redirect_to admin_zones_path, notice: "Zone deleted"
  end
end

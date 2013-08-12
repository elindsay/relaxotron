class Admin::VideosController < AdminController

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(params[:video])
    if @video.save
      redirect_to admin_videos_path
    else
      render :new
    end
  end

  def edit
    @video = Video.find(params[:id])
  end

  def update
    @video = Video.find(params[:id])
    @video.update_attributes(params[:video])
    if @video.save
      redirect_to admin_videos_path
    else
      render :edit
    end
  end

  def index
    @videos = Video.all
  end

  def show
    @video = Video.find_by_slug(params[:id])
  end
  
end
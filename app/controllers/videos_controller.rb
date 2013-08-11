class Admin::VideosController < AdminController

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(params[:video])
    if @video.save
      redirect_to videos_path
    else
      render :new
    end
  end

  def index
    @videos = Video.all
  end

  def show
    @video = Video.find_by_slug(params[:id])
  end
  
end

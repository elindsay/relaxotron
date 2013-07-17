class VideosController < ApplicationController
  def new
    @video = Video.new
  end

  def create
    if @video = Video.create(params[:video])
      redirect_to videos_path
    else
      render :new
    end
  end

  def index
    @videos = Video.all
  end
end

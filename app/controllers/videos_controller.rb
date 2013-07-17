class VideosController < ApplicationController
  before_filter :authenticate
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
  
  protected
    def authenticate
      authenticate_or_request_with_http_basic do |username, password|
        username == "thebusman" && password == "AsDf1234!"
      end
  end
  
end

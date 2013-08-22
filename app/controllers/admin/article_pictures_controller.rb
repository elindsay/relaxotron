class Admin::ArticlePicturesController < AdminController
  def new
    @article_picture = ArticlePicture.new
  end

  def create
    @article_picture = ArticlePicture.create(params[:article_picture])
    if @article_picture.save
      redirect_to admin_articles_path
    else
      render :new
    end
  end
end

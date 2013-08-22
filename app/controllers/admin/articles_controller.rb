class Admin::ArticlesController < AdminController
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params[:article])
    if @article.save
      redirect_to admin_articles_path
    else
      render :new
    end
  end

  def index
    @articles = Article.all
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(params[:article])
      redirect_to admin_articles_path
    else
      render :edit
    end
  end
end

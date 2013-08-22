class HomeController < ApplicationController
  def index
    @zone = Zone.all.sample
    @article_one = Article.find(1)
  end
end

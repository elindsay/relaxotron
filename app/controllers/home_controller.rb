class HomeController < ApplicationController
  def index
    @zone = Zone.all.sample
    @article_one = Article.find(1)
    @article_two = Article.find(2)
    @article_three = Article.find(3)
  end
end

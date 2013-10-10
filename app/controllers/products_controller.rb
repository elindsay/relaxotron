class ProductsController < ApplicationController
  def index
    @products = Product.where("stock_count >= ?", 1)
  end
end

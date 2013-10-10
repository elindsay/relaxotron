class ProductsController < ApplicationController
  def index
    @product_matrix = Product.where("stock_count >= ?", 1).each_slice(3).to_a.map{|sa| sa[2] = sa[2]; sa}.transpose.map{|sa| sa.compact}
  end
end

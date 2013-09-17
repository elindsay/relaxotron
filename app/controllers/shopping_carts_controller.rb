class ShoppingCartsController < ApplicationController
  def add_to_cart
    session[:my_cart] ||= [] 
    session[:my_cart] << params[:product_id] unless session[:my_cart].include?(params[:product_id]) 
    redirect_to products_path
  end
  
  def remove_from_cart
    session[:my_cart] ||= [] 
    session[:my_cart].delete(params[:product_id])
    redirect_to :back
  end
end

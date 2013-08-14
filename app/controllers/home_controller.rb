class HomeController < ApplicationController
  def index
    @zone = Zone.all.sample
  end
end

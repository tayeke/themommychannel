class HomeController < ApplicationController
  def index
    @categories = Magnify::Category.new(ENV['MAGNIFY_TOKEN']).all
  end
end

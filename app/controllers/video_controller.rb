class VideoController < ApplicationController
  def category
    @category = Magnify::Category.new(ENV['MAGNIFY_TOKEN']).find(params[:id])
  end

  def show
    @video = Magnify::Video.new(ENV['MAGNIFY_TOKEN']).find(params[:id])
  end
end

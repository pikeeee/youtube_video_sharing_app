# frozen_string_literal: true

class VideosController < ApplicationController
  before_action :authorized, only: %i[new create]

  def index
    @videos = Video.all
  end

  def new
    @video = Video.new
  end

  def create
    @video = current_user.videos.build(video_params)

    if @video.save
      redirect_to root_path, notice: 'Video shared successfully!'
    else
      render :new
    end
  end

  private

  def video_params
    params.require(:video).permit(:url)
  end

  def extract_video_id(url)
    url.match(%r{youtu(?:\.be|be\.com)/(?:watch\?v=)?([\w-]{11})})&.[](1)
  end
end

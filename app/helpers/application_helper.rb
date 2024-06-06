# frozen_string_literal: true

module ApplicationHelper
  def extract_video_id(url)
    url.match(%r{youtu(?:\.be|be\.com)/(?:watch\?v=)?([\w-]{11})})&.[](1)
  end
end

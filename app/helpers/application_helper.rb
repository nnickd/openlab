module ApplicationHelper
  def youtube_frame(url)
    content_tag(:iframe, '', src: url, width: 768, height: 432, frameborder: 0)
  end
end

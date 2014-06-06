module ApplicationHelper
  def markdown(text)
    extensions = { no_intra_emphasis: true, autolink: true }
    renderer = Redcarpet::Render::HTML.new()
    markdown = Redcarpet::Markdown.new(renderer, extensions)
    markdown.render(text).html_safe
  end
end

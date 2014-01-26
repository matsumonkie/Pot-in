module ApplicationHelper
  @@markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)

  def render_md(text)
    @@markdown.render(text).html_safe
  end
end

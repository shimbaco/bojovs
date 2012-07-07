module Blog::ArticlesHelper
  def markdown(body)
    mk = ::Redcarpet::Markdown.new(Redcarpet::Render::HTML,
      autolink: true, space_after_headers: true)

    mk.render(body)
  end
end
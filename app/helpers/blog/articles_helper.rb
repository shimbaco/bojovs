module Blog::ArticlesHelper
  def markdown(body)
    rndr = Redcarpet::Render::HTML.new(hard_wrap: true, with_toc_data: true)
    mk = ::Redcarpet::Markdown.new(rndr, autolink: true, fenced_code_blocks: true,
      space_after_headers: true)

    mk.render(body)
  end
end
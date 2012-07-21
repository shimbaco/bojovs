require File.expand_path("#{Rails.root}/lib/bojovs/markdown")

module NotesHelper
  def markdown(body)
    rndr = ::Bojovs::Markdown::HTMLPygments.new(Bojovs::Markdown.html_options)
    mk = ::Bojovs::Markdown.markdownify(rndr)

    mk.render(body)
  end
end
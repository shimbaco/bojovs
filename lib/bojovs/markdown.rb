module Bojovs
  module Markdown
    def self.markdown_options
      { autolink: true, fenced_code_blocks: true, space_after_headers: true }
    end

    def self.html_options
      { hard_wrap: true, with_toc_data: true }
    end

    def self.markdownify(rndr)
      Redcarpet::Markdown.new(rndr, markdown_options)
    end

    class HTMLPygments < Redcarpet::Render::HTML
      def block_code(code, language)
        if language.present?
          Pygments.highlight(code, lexer: language)
        else
          rndr = Redcarpet::Render::HTML.new(Bojovs::Markdown.html_options)
          Bojovs::Markdown.markdownify(rndr).render(code)
        end
      end
    end
  end
end
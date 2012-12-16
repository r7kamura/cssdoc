require "nokogiri"
require "redcarpet"

module Cssdoc
  class Section
    class << self
      def render(content)
        renderer.render(content)
      end

      private

      def renderer
        @renderer ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML)
      end
    end

    def <<(line)
      lines << line
    end

    def code
      if node = tree.css("code")[-1]
        node.text.strip
      end
    end

    def render
      @render ||= self.class.render(content)
    end

    private

    def tree
      Nokogiri.HTML(render)
    end

    def content
      lines.join("\n")
    end

    def lines
      @lines ||= []
    end
  end
end

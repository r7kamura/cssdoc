module Cssdoc
  class Parser
    class Line
      REGEXPS = {
        :single_comment      => %r<^\s*(//)>,
        :begin_multi_comment => %r<^\s*(/\*)>,
        :end_multi_comment   => %r<\*/\s*$>,
      }.freeze

      attr_accessor :content

      def initialize(content)
        @content = content
      end

      def single_comment?
        REGEXPS[:single_comment] === content
      end

      def begin_multi_comment?
        REGEXPS[:begin_multi_comment] === content
      end

      def end_multi_comment?
        REGEXPS[:end_multi_comment] === content
      end

      def comment?
        single_comment? || begin_multi_comment? || end_multi_comment?
      end

      def stripped_content
        content.gsub(comment_regexp, "").strip
      end

      private

      def comment_regexp
        Regexp.union(REGEXPS.values)
      end
    end
  end
end

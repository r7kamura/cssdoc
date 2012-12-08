module Cssdoc
  class Parser
    def initialize(path)
      @path = path
    end

    def parse
      lines.each do |line|
        if current_section
          if line.comment?
            current_section << line.stripped_content
          end
          if line.end_multi_comment? || !line.comment?
            sections << current_section
            self.current_section = nil
          end
        else
          if line.begin_multi_comment? || line.single_comment?
            self.current_section = Section.new
            current_section << line.stripped_content
          end
        end
      end
      Document.new(path, sections)
    end

    private

    attr_reader :path
    attr_accessor :current_section

    def lines
      path.each_line.map {|line| Line.new(line) }
    end

    def sections
      @sections ||= []
    end
  end
end

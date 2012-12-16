module Cssdoc
  class Parser
    def initialize(path)
      @path = path
    end

    def parse
      lines.each do |line|
        begin_multi_comment  if line.begin_multi_comment?
        begin_single_comment if !in_comment && !current_section && line.comment?
        add_line(line)       if in_comment || line.comment?
        end_single_comment   if !in_comment && current_section && !line.comment?
        end_multi_comment    if line.end_multi_comment?
      end
      Document.new(@path, sections)
    end

    private

    attr_accessor :current_section, :in_comment
    private       :current_section, :in_comment

    def lines
      @path.each_line.map {|line| Line.new(line) }
    end

    def sections
      @sections ||= []
    end

    def begin_multi_comment
      begin_single_comment
      self.in_comment = true
    end

    def begin_single_comment
      self.current_section = Section.new
    end

    def add_line(line)
      current_section << line.stripped_content
    end

    def end_single_comment
      sections << current_section
      self.current_section = nil
    end

    def end_multi_comment
      end_single_comment
      self.in_comment = nil
    end
  end
end

module Cssdoc
  class Document
    attr_reader :path

    def initialize(path, sections)
      @path     = path
      @sections = sections
    end

    def sections
      @sections.select(&:code)
    end
  end
end

require "pathname"

module Cssdoc
  class DocumentFinder
    def initialize(pattern = "**/*.{css,sass,scss}")
      @pattern = pattern
    end

    def find(path)
      path_document_table[path.to_s]
    end

    def documents
      @documents ||= paths.inject([]) do |array, path|
        document = Parser.new(path).parse
        if document.sections.empty?
          array
        else
          array << document
        end
      end
    end

    private

    attr_reader :pattern

    def path_document_table
      @path_document_table ||= documents.inject({}) do |hash, document|
        hash.merge(document.path.to_s => document)
      end
    end

    def paths
      Pathname.glob(pattern)
    end
  end
end

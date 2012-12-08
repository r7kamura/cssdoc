require "spec_helper"

module Cssdoc
  describe Parser do
    let(:parser) do
      described_class.new(path)
    end

    let(:path) do
      mock(:each_line => content.each_line)
    end

    let(:content) do
      ""
    end

    describe "#parse" do
      context "when file has a comment section of single line format" do
        let(:content) do
          <<-EOF
            // description
            //
            // ```
            // <button class="button">button</button>
            // ```
            .button {
              ...
            }
          EOF
        end

        it "finds 1 comment section" do
          parser.parse
          parser.send(:sections).should have(1).section
        end
      end

      context "when file has a comment section of multi line format" do
        let(:content) do
          <<-EOF
            /*
              description

              ```
              <button class="button">button</button>
              ```
            */
            .button {
              ...
            }
          EOF
        end

        it "finds 1 comment section" do
          parser.parse
          parser.send(:sections).should have(1).section
        end
      end

      context "when file has 2 comment sections" do
        let(:content) do
          <<-EOF
            /*
              description

              ```
              <button class="button">button</button>
              ```
            */
            .button {
              ...
            }

            /*
              description

              ```
              <button class="button">button</button>
              ```
            */
            .button {
              ...
            }
          EOF
        end

        it "finds 2 comment section" do
          parser.parse
          parser.send(:sections).should have(2).section
        end
      end
    end
  end
end

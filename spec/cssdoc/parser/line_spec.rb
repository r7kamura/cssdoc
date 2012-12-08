require "spec_helper"

module Cssdoc
  class Parser
    describe Line do
      let(:line) do
        described_class.new(content)
      end

      subject do
        line
      end

      describe "#single_comment?" do
        truthy = "  // comment"
        falsy  = "  /*"

        context "when content is #{truthy.inspect}" do
          let(:content) do
            truthy
          end
          it { should be_single_comment }
        end

        context "when content is #{falsy.inspect}" do
          let(:content) do
            falsy
          end
          it { should_not be_single_comment }
        end
      end

      describe "#begin_multi_comment?" do
        truthy = "  /*"
        falsy  = "  */"

        context "when content is #{truthy.inspect}" do
          let(:content) do
            truthy
          end
          it { should be_begin_multi_comment }
        end

        context "when content is #{falsy.inspect}" do
          let(:content) do
            falsy
          end
          it { should_not be_begin_multi_comment }
        end
      end

      describe "#end_multi_comment?" do
        truthy = "  */"
        falsy  = "  /*"

        context "when content is #{truthy.inspect}" do
          let(:content) do
            truthy
          end
          it { should be_end_multi_comment }
        end

        context "when content is #{falsy.inspect}" do
          let(:content) do
            falsy
          end
          it { should_not be_end_multi_comment }
        end
      end
    end
  end
end

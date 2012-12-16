require "spec_helper"

module Cssdoc
  describe DocumentFinder do
    let(:manager) do
      described_class.new
    end

    describe "#find" do
      subject do
        manager.find(path)
      end

      context "when given path of existing file" do
        let(:path) do
          "spec/fixtures/example.css"
        end

        it { should be_a Document }
      end

      context "when given path of non-existing file" do
        let(:path) do
          "spec/fixtures/non-existing.css"
        end

        it { should be_nil }
      end
    end
  end
end

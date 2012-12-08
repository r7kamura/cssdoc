require "spec_helper"

module Cssdoc
  describe Section do
    let(:section) do
      described_class.new.tap do |this|
        lines.each do |line|
          this << line
        end
      end
    end

    describe "#code" do
      subject do
        section.code
      end

      context "when there is one code block" do
        let(:lines) do
          <<-EOF.each_line.map(&:strip)
            description

            ```
            <button class="button">button</button>
            ```
          EOF
        end

        it "returns code block as string" do
          should == %{<button class="button">button</button>}
        end
      end

      context "when there is two code blocks" do
        let(:lines) do
          <<-EOF.each_line.map(&:strip)
            description

            ```
            dummy code block
            ```

            ```
            <button class="button">button</button>
            ```
          EOF
        end

        it "returns last code block as string" do
          should == %{<button class="button">button</button>}
        end
      end
    end
  end
end

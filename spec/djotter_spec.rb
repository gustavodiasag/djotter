require "djotter"
require "spec_helper"

TEST_FILES = Dir.glob(File.join(__dir__, "cases", "*.test"))

describe Djotter do
  TEST_FILES.each do |path|
    context("#{path}") do
      tests = parse_tests(path)

      tests.each_with_index do |test, idx|
        it "converts correctly case #{idx}" do
          actual = described_class.to_html(test[:inp])
          expected = test[:exp]

          expect(actual).to(eq(expected))
        end
      end
    end
  end
end

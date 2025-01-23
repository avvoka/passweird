# frozen_string_literal: true

RSpec.describe Passweird::LeetSpeak do
  describe "#convert" do
    let(:instance) { described_class.new("example") }

    it "converts the original string to leet speak" do
      expect(instance.convert).to eq("3x4mp13")
    end
  end

  describe ".convert" do
    it "converts a string to leet speak" do
      expect(described_class.convert("example")).to eq("3x4mp13")
    end
  end

  describe ".convert_all" do
    it "converts an array of strings to leet speak" do
      expect(described_class.convert_all(%w[example test])).to eq(%w[3x4mp13 7357])
    end
  end
end

# frozen_string_literal: true

RSpec.describe Passweird::LeetSpeak do
  describe "#leet" do
    let(:instance) { described_class.new("example") }

    it "converts the original string to leet speak" do
      expect(instance.leet).to eq("3x4mpl3")
    end
  end

  describe ".leet" do
    it "converts a string to leet speak" do
      expect(described_class.leet("example")).to eq("3x4mpl3")
    end
  end

  describe ".leet_all" do
    it "converts an array of strings to leet speak" do
      expect(described_class.leet_all(%w[example test])).to eq(%w[3x4mpl3 7357])
    end
  end
end

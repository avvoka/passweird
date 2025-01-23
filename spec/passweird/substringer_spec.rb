# frozen_string_literal: true

RSpec.describe Passweird::Substringer do
  describe ".substrings" do
    it "generates all unique substrings with a minimum length" do
      expect(described_class.substrings("ruby", min_length: 3)).to match_array(%w[rub ruby uby])
    end

    it "returns the root string if it is shorter than the minimum length" do
      expect(described_class.substrings("ruby", min_length: 10)).to eq(["ruby"])
    end

    it "includes the root string" do
      expect(described_class.substrings("ruby", min_length: 3)).to include("ruby")
    end

    it "raises an error if the root string is not a string" do
      expect { described_class.substrings(123) }.to raise_error(ArgumentError, "root_string must be a String")
    end
  end

  describe "#substrings" do
    let(:instance) { described_class.new("ruby") }

    it "generates all unique substrings" do
      expect(instance.substrings).to match_array(%w[rub ruby uby])
    end

    it "returns the root string if it is shorter than the minimum length" do
      expect(instance.substrings(min_length: 10)).to eq(["ruby"])
    end

    it "includes the root string" do
      expect(instance.substrings).to include("ruby")
    end

    it "raises an error if the root string is not a string" do
      expect { described_class.new(123) }.to raise_error(ArgumentError, "root_string must be a String")
    end
  end
end

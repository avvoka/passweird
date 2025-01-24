# frozen_string_literal: true

RSpec.describe Passweird::Checker do
  describe ".blacklisted?" do
    describe "when the password is blacklisted" do
      before do
        Passweird::BlacklistedTerm.create(term: "pass")
      end

      it "returns true" do
        expect(described_class.blacklisted?("pass")).to be true
      end

      describe "where a substring of the password is blacklisted" do
        it "returns true" do
          expect(described_class.blacklisted?("password")).to be true
        end
      end

      describe "where a leet speak version of the password substring is blacklisted" do
        it "returns true" do
          expect(described_class.blacklisted?("p455w0rd")).to be true
        end
      end
    end

    describe "when the password is NOT blacklisted" do
      before do
        Passweird::BlacklistedTerm.create(term: "anotherword")
      end

      it "returns false" do
        expect(described_class.blacklisted?("password")).to be false
      end
    end
  end
end

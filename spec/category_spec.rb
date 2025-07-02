require "sales_tax/category"

RSpec.describe SalesTax::Category do
  describe ".for" do
    it "classifies exempt and non‑exempt correctly" do
      expect(described_class.for("book")).to eq(:book)
      expect(described_class.for("chocolate")).to eq(:food)
      expect(described_class.for("pills")).to eq(:medical)
      expect(described_class.for("perfume")).to eq(:other)
    end
  end

  describe ".exempt?" do
    it "returns true for exempt categories" do
      expect(described_class.exempt?(:book)).to be true
      expect(described_class.exempt?(:other)).to be false
    end
  end
end
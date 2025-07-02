require "sales_tax/tax_calculator"
require "bigdecimal"

RSpec.describe SalesTax::TaxCalculator do
  describe ".round_up" do
    it "rounds up to the nearest 0.05" do
      expect(described_class.round_up(BigDecimal("1.02"))).to eq(BigDecimal("1.05"))
      expect(described_class.round_up(BigDecimal("2.50"))).to eq(BigDecimal("2.50"))
    end
  end
end
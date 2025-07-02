require "sales_tax/item"
require "bigdecimal"

RSpec.describe SalesTax::Item do
  context "basic (non‑imported) taxable item" do
    let(:item) { described_class.new(quantity: 1, name: "music CD", shelf_price: 14.99) }

    it "applies 10% basic tax rounded up" do
      expect(item.basic_tax_amount).to eq(BigDecimal("1.50"))
      expect(item.total_price).to eq(BigDecimal("16.49"))
    end
  end

  context "imported and exempt item" do
    let(:item) { described_class.new(quantity: 2, name: "imported box of chocolates", shelf_price: 10.00) }

    it "applies only 5% import duty" do
      expect(item.import_duty_amount).to eq(BigDecimal("0.50"))
      expect(item.total_price * item.quantity).to eq(BigDecimal("21.00"))
    end
  end
end
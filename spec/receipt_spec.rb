# spec/receipt_spec.rb
require "sales_tax/receipt"
require "sales_tax/item"

RSpec.describe SalesTax::Receipt do
  it "formats a simple basket correctly" do
    items = [
      SalesTax::Item.new(quantity: 1, name: "book", shelf_price: 12.49),
      SalesTax::Item.new(quantity: 1, name: "music CD", shelf_price: 14.99),
    ]
    receipt = described_class.new(items)
    expected = <<~TXT.strip
      1 book: 12.49
      1 music CD: 16.49
      Sales Taxes: 1.50
      Total: 28.98
    TXT
    expect(receipt.format).to eq(expected)
  end
end

require "bigdecimal"
require "sales_tax/category"
require "sales_tax/tax_calculator"

module SalesTax
  class Item
    attr_reader :quantity, :name, :shelf_price, :category, :imported

    def initialize(quantity:, name:, shelf_price:)
      @quantity    = quantity
      @name        = name
      @shelf_price = BigDecimal(shelf_price.to_s)
      @imported    = name.downcase.include?("imported")
      @category    = Category.for(name)
    end

    def basic_tax_amount
      return BigDecimal("0") if Category.exempt?(category)
      raw = shelf_price * BigDecimal("0.10")
      TaxCalculator.round_up(raw)
    end

    def import_duty_amount
      return BigDecimal("0") unless imported
      raw = shelf_price * BigDecimal("0.05")
      TaxCalculator.round_up(raw)
    end

    def total_tax
      basic_tax_amount + import_duty_amount
    end

    def total_price
      shelf_price + total_tax
    end
  end
end
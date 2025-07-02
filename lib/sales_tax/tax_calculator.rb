require "bigdecimal"

module SalesTax
  module TaxCalculator
    ROUND_UP_VAL = BigDecimal("0.05").freeze

    def self.round_up(amount)
      ((amount / ROUND_UP_VAL).ceil) * ROUND_UP_VAL
    end
  end
end
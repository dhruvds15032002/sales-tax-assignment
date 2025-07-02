module SalesTax
  class Receipt
    def initialize(items)
      @items = items
    end

    def sales_taxes
      @items.sum { |it| it.total_tax * it.quantity }
    end

    def total
      @items.sum { |it| it.total_price * it.quantity }
    end

    def format
      lines = @items.map do |it|
        amt = sprintf("%.2f", it.total_price * it.quantity)
        "#{it.quantity} #{it.name}: #{amt}"
      end
      lines << "Sales Taxes: #{sprintf('%.2f', sales_taxes)}"
      lines << "Total: #{sprintf('%.2f', total)}"
      lines.join("\n")
    end
  end
end
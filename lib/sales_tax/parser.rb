require "sales_tax/item"

module SalesTax
  class Parser
    LINE_RE = /^(\d+)\s(.+)\s+at\s+([\d.]+)$/

    def self.parse_all(lines)
      lines.map do |line|
        next if line.strip.empty?
        m = line.match(LINE_RE)
        unless m
          warn "Skipping invalid line: #{line}"
          next
        end
        qty, name, price = m[1].to_i, m[2], m[3]
        Item.new(quantity: qty, name: name, shelf_price: price)
      end.compact
    end
  end
end
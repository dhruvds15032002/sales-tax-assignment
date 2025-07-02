module SalesTax
  module Category
    EXEMPTED = {
      book:    %w[book books],
      food:    %w[chocolate chocolates cake sandwich apple],
      medical: %w[pills tablet syrup]
    }.freeze

    def self.for(name)
      downcased_name = name.downcase
      EXEMPTED.each do |cat, keys|
        return cat if keys.any? { |kw| downcased_name.include?(kw) }
      end
      :other
    end

    def self.exempt?(category)
      category != :other
    end
  end
end
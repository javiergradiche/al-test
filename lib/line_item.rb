class LineItem
  attr_accessor :quantity, :is_imported, :name, :price_unit,
                :subtotal_without_taxes, :subtotal_with_taxes,
                :tax_sale, :tax_duty

  TAX_EXCEPTION_KEYS = ['book', 'food', 'packed' ]
  TAX_SALES = 0.10
  TAX_DUTY = 0.05

  def initialize(options)
    self.quantity = options[:quantity] || 1
    self.is_imported = options[:is_imported] || false
    self.name = options[:name] || 'No Name'
    self.price_unit = options[:price_unit] || 0.0
    self.subtotal_without_taxes = self.quantity * self.price_unit
  end

  def refresh_taxes
    add_tax_sale
    add_tax_duty
    self.subtotal_with_taxes = self.subtotal_without_taxes + self.tax_sale + self.tax_duty
  end

  def add_tax_sale
    is_excepted = TAX_EXCEPTION_KEYS.any? { |s| self.name.include? s }
    puts `#{self.name} is_excepted? #{is_excepted}`
    self.tax_sale = is_excepted ?
                      round_zero_or_five(self.subtotal_without_taxes * TAX_SALES):
                      0
  end

  def add_tax_duty
    self.tax_duty = (self.subtotal_without_taxes + self.tax_sale) * TAX_DUTY
  end


  def round_zero_or_five(dec)
    rounded = dec.round(2)
  end
end

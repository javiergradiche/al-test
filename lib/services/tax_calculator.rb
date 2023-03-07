require 'bigdecimal/util'

module TaxCalculator
  # Exception: 0%, [books, food, and medical products]
  TAX_EXCEPTION_KEYS = %w[book chocolate pills].freeze

  TAX_SALES = 0.10.to_d
  TAX_DUTY = 0.05.to_d
  ROUND_DEC = 1.0.to_d / TAX_DUTY

  def calculate_taxes
    add_tax_sale
    add_tax_duty
    self.subtotal_with_taxes = (self.subtotal_without_taxes + self.tax_sale + self.tax_duty).to_d
  end

  def add_tax_sale
    is_excepted = TAX_EXCEPTION_KEYS.any? { |s| self.name.include? s }
    self.tax_sale = is_excepted ?
      0 :
      round_zero_or_five(self.subtotal_without_taxes * TAX_SALES)
  end

  def add_tax_duty
    self.tax_duty = self.is_imported ?
      round_zero_or_five(self.subtotal_without_taxes  * TAX_DUTY) :
      0
  end

  def round_zero_or_five(dec)
    ((dec * ROUND_DEC).ceil / ROUND_DEC).to_d
  end

end
require './lib/services/tax_calculator.rb'

class LineItem
  include TaxCalculator

  attr_accessor :quantity, :is_imported, :name, :price_unit,
                :subtotal_without_taxes, :subtotal_with_taxes,
                :tax_sale, :tax_duty

  def initialize(options)
    self.quantity = options[:quantity] || 1
    self.is_imported = options[:is_imported] || false
    self.name = options[:name] || 'No Name'
    self.price_unit = options[:price_unit] || 0.0
    self.subtotal_without_taxes = self.quantity * self.price_unit
  end

  def refresh_taxes
    calculate_taxes
  end

end

require 'bigdecimal/util'
require './lib/services/tax_calculator.rb'

class LineItem
  include TaxCalculator

  attr_reader :quantity, :is_imported, :name, :price_unit,
                :subtotal_without_taxes
  attr_accessor :tax_sale, :tax_duty, :subtotal_with_taxes

  def initialize(options)
    @quantity = options[:quantity] || 1
    @is_imported = options[:is_imported] || false
    @name = options[:name] || 'No Name'
    @price_unit = options[:price_unit].to_d || BigDecimal(0)
    @subtotal_without_taxes = @quantity * @price_unit
  end
end

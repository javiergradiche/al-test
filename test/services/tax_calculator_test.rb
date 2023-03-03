require 'minitest/autorun'
require 'minitest/pride'
require './lib/models/line_item.rb'
require './lib/services/tax_calculator.rb'

class TaxCalculatorTest < Minitest::Test
  def test_sale_taxes_with_exception
    line_item = LineItem.new(
      {quantity: 2, is_imported: false, name: 'book', price_unit: 12.49 }
    )
    line_item.calculate_taxes
    assert_equal 24.98, line_item.subtotal_with_taxes
    assert_equal 0, line_item.tax_sale
    assert_equal 0, line_item.tax_duty
  end

  def test_sale_taxes_without_exception
    line_item = LineItem.new(
      {quantity: 1, is_imported: false, name: 'music CD', price_unit: 14.99 }
    )
    line_item.calculate_taxes
    assert_equal 16.49, line_item.subtotal_with_taxes
    assert_equal 1.50, line_item.tax_sale
    assert_equal 0, line_item.tax_duty
  end

  def test_imported_taxes_with_exception
    line_item = LineItem.new(
      {quantity: 1, is_imported: true, name: 'box of chocolates', price_unit: 10.00 }
    )
    line_item.calculate_taxes
    assert_equal 10.5, line_item.subtotal_with_taxes
    assert_equal 0, line_item.tax_sale
    assert_equal 0.5, line_item.tax_duty
  end

  def test_imported_taxes_without_exception
    line_item = LineItem.new(
      {quantity: 1, is_imported: true, name: 'bottle of perfume ', price_unit: 47.50 }
    )
    line_item.calculate_taxes
    assert_equal 54.65, line_item.subtotal_with_taxes
    assert_equal 4.75, line_item.tax_sale
    assert_equal 2.40, line_item.tax_duty
  end


end
require 'minitest/autorun'
require 'minitest/pride'
require './lib/line_item.rb'
require './lib/cart.rb'

class CartTest < Minitest::Test
  def test_sale_taxes_with_exception_without_import
    line_item1 = LineItem.new({quantity: 2, is_imported: false, name: 'book', price_unit: 12.49 })
    line_item2 = LineItem.new({quantity: 1, is_imported: false, name: 'music', price_unit: 12.49 })
    line_item3 = LineItem.new({quantity: 1, is_imported: false, name: 'chocolate', price_unit: 12.49 })

    cart = Cart.new
    cart.add_line_item(line_item1)
    cart.add_line_item(line_item2)
    cart.add_line_item(line_item3)
    assert_equal 3, cart.line_items.size

    cart.refresh
    byebug
    assert_equal 1.50, cart.sales_taxes
    assert_equal 42.32, cart.total
  end


end

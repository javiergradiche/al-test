require 'minitest/autorun'
require 'minitest/pride'
require './lib/models/line_item.rb'
require './lib/models/cart.rb'
require './lib/services/parser.rb'

class CartTest < Minitest::Test
  def test_add_line_item
    line_item1 = LineItem.new({quantity: 2, is_imported: false, name: 'book', price_unit: 12.49 })
    line_item2 = LineItem.new({quantity: 1, is_imported: false, name: 'music', price_unit: 12.49 })
    line_item3 = LineItem.new({quantity: 1, is_imported: false, name: 'chocolate', price_unit: 12.49 })

    parser = Parser.new
    cart = Cart.new(parser)

    cart.add_line_item(line_item1)
    cart.add_line_item(line_item2)
    cart.add_line_item(line_item3)
    assert_equal 3, cart.count
  end


  def test_add_line_item_from_str
    parser = Parser.new
    cart = Cart.new(parser)

    assert_equal 0, cart.count
    cart.add_line_item_from_str('2 book at 12.49')
    assert_equal 1, cart.count
  end
end

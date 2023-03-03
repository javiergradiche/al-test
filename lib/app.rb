#!/usr/bin/env ruby
require './lib/models/cart.rb'
require './lib/models/line_item.rb'
require './lib/services/parser.rb'

def create_cart_from_file(filename)
  cart = Cart.new
  parser = Parser.new

  File.open(filename, "r").each_line do |str_line|
    values = parser.parse_line str_line
    line_item = LineItem.new values
    cart.add_line_item line_item
  end

  cart.complete
  cart
end


if ARGV.length != 1
    puts "Please add the name of the input file."
    exit;
end

filename = ARGV[0]
cart = create_cart_from_file(filename)
puts cart.to_s
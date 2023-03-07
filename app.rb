#!/usr/bin/env ruby
require './lib/models/cart.rb'
require './lib/services/parser.rb'

def create_cart_from_file(filename)
  parser = Parser.new
  cart = Cart.new parser

  begin
    File.foreach(filename) do |str_line|
      cart.add_line_item_from_str str_line
    end
    cart
  rescue SystemCallError => e
    $stderr.puts "Error trying to read the file: #{e}"
    exit -1
  end
end


if ARGV.length != 1
  puts "Please add the name of the input file."
  exit;
end

filename = ARGV[0]
cart = create_cart_from_file(filename)
puts cart.to_s
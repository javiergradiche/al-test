require 'minitest/autorun'
require 'minitest/pride'
require './lib/app.rb'

class AppTest < Minitest::Test

  def test_app_input_1
    input1 = <<~HEREDOC
    2 book at 12.49
    1 music CD at 14.99
    1 chocolate bar at 0.85
            HEREDOC
    output1 = <<~HEREDOC
    2 book: 24.98
    1 music CD: 16.49
    1 chocolate bar: 0.85
    Sales Taxes: 1.50
    Total: 42.32
    HEREDOC

    cart_output = App.new(input1).process
  end

  def test_app_input_2
    # input2 = <<~HEREDOC
    # 1 imported box of chocolates at 10.00
    # 1 imported bottle of perfume at 47.50
    # HEREDOC

    # output2 = <<~HEREDOC
    # 1 imported box of chocolates: 10.50
    # 1 imported bottle of perfume: 54.65
    # Sales Taxes: 7.65
    # Total: 65.15
    # HEREDOC
  end

  def test_app_input_2
    # input3 = <<~HEREDOC
    # 1 imported bottle of perfume at 27.99
    # 1 bottle of perfume at 18.99
    # 1 packet of headache pills at 9.75
    # 3 imported boxes of chocolates at 11.25
    # HEREDOC

    # output3 = <<~HEREDOC
    # 1 imported bottle of perfume: 32.19
    # 1 bottle of perfume: 20.89
    # 1 packet of headache pills: 9.75
    # 3 imported box of chocolates: 35.55
    # Sales Taxes: 7.90
    # Total: 98.38
    # HEREDOC
  end


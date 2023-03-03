#Taxes#

- Basic sales tax is applicable at a rate of 10% on all goods, except books, food, and medical products that are exempt. Import duty is an additional sales tax applicable on all imported goods at a rate of 5%, with no exemptions.

tax

- exception: 0%, [books, food, and medical products]
- rest: 10%

import duty

- no exceptions
- all: 5%

#Input#
[quantity] [imported|""] [name] at [unit_price]

- Price (include tax)

#Output#

- When I purchase items I receive a receipt which lists the name of all the items and their price (including tax), finishing with the total cost of the items, and the total amounts of sales taxes paid.

[quantity] [imported|""] [name]: [price_with_taxes]
Sales Taxes: [sales_taxes]
Total: [total]

#Rounding (only sale taxes)
The rounding rules for sales tax are that for a tax rate of n%, a shelf price of p contains (np/100 rounded up to the nearest 0.05) amount of sales tax.

Input 1:
2 book at 12.49
1 music CD at 14.99
1 chocolate bar at 0.85

Output 1:
2 book: 24.98
1 music CD: 16.49
1 chocolate bar: 0.85
Sales Taxes: 1.50
Total: 42.32

Input 2:
1 imported box of chocolates at 10.00
1 imported bottle of perfume at 47.50

Output 2:
1 imported box of chocolates: 10.50
1 imported bottle of perfume: 54.65
Sales Taxes: 7.65
Total: 65.15

Input 3:
1 imported bottle of perfume at 27.99
1 bottle of perfume at 18.99
1 packet of headache pills at 9.75
3 imported boxes of chocolates at 11.25

Output 3:
1 imported bottle of perfume: 32.19
1 bottle of perfume: 20.89
1 packet of headache pills: 9.75
3 imported box of chocolates: 35.55
Sales Taxes: 7.90
Total: 98.38

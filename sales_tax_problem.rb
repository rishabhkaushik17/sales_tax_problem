# Using Ruby version: ruby 2.7.1p83 (2020-03-31 revision a0c7c23c9c) [x86_64-linux]
# Your Ruby code here
# frozen_string_literal: true

# Creating a class Product
class Product
    SALES_TAX = 0.1
    IMPORT_DUTY = 0.05
    attr_reader :name, :price, :tax
    def input
        hash = {}
        print 'Name of the product: '
        hash[:name] = gets.chomp
        print 'Imported?: '
        hash[:imported] = gets.chomp
        print 'Exempted from sales tax?: '
        hash[:sales_tax] = gets.chomp
        print 'Price: '
        hash[:price] = gets.chomp.to_i
        hash
    end
  
    def initialize
        input_hash = input
        @name = input_hash[:name]
        @imported = input_hash[:imported]
        @sales_tax_applicable = input_hash[:sales_tax]
        @price = input_hash[:price]
        @tax = calculate_tax
    end
  
    def calculate_tax
        tax = 0
        tax += @price * SALES_TAX if @sales_tax_applicable == 'no'
        tax += @price * IMPORT_DUTY if @imported == 'yes'
        tax
    end
  
    def self.make_list_and_grand_total_tax(product_arr)
        arr = []
        arr << ['=' * 53]
        arr << ['PRODUCT'.ljust(15), 'PRICE'.ljust(15), 'TAX'.ljust(15)]
        grand_total = 0
        product_arr.each do |product|
            arr << [product.name.ljust(15), product.price.to_s.ljust(15), product.tax.to_s.ljust(15)]
            grand_total += product.price + product.tax
        end
        arr << ['=' * 53]
        arr << ['Grand Total'.ljust(15), grand_total.round.to_s.ljust(15)]
        arr
    end
end
  
product_arr = []
add = 'y'
while add == 'y'
    product_arr << Product.new
    print 'Do you want to add more items to your list(y/n): '
    add = gets.chomp
    puts
end
  
print Product.make_list_and_grand_total_tax(product_arr)
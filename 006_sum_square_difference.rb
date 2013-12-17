require 'benchmark'

# The sum of the squares of the first ten natural numbers is,

# 1^2 + 2^2 + ... + 10^2 = 385
# The square of the sum of the first ten natural numbers is,

# (1 + 2 + ... + 10)^2 = 552 = 3025
# Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 − 385 = 2640.

# Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.

# Get the sum of the squares all values up to a given number, inclusive
def sum_of_squares_up_to(num)
  squares = 1.upto(num).map { |i| i * i }
  squares.inject { |result, elem| result + elem }
end

# Get the sum of all values up to a given number, inclusive
def sum_up_to(num)
  1.upto(num).inject { |result, elem| result + elem }
end

# Now try squaring the result of sum_up_to
def square_of_sum(num)
  num * num
end

values = *(10..100)

values.each do |v|
  sum = sum_up_to(v)
  squares_summed = sum_of_squares_up_to(v)
  sum_squared = square_of_sum(sum)
  Benchmark.bmbm do |bm|
    bm.report("The difference between the sum squared and the sum of the squares between 1 and #{v}:")   { p sum_squared - squares_summed }
  end
end

require 'benchmark'

# 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

# What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

# We can apply the Sieve of Eratosthenes - as we go up, when we find a number that's not divisible by one of (1..10), for example, we can eliminate all future multiples of that number as well

class Multiple
  attr_reader :value

  def initialize(value)
    @value = value
  end

  def divisible_by_all?(num = 20)
    halfway = num/2 + 1
    temp = num.downto(halfway).reject do |n|
      break false if self.value % n != 0
      self.value % n == 0
    end
    temp.size == 0 if temp.is_a? Array
  end

end

def smallest_multiple_up_to(num)
  n = num   # start with 20 and increment by multiples of 20
  loop do
    n += num
    check = Multiple.new(n).divisible_by_all?(num)
    break n if check == true
  end
end

puts "The smallest number that's divisible by each of the numbers from 1 to 10 is #{smallest_multiple_up_to(10)}"

values = [ 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20 ]

values.each do |v|
  Benchmark.bm(10) do |x|
    x.report("smallest multiple for all values up to #{v}:")   { p smallest_multiple_up_to(v) }
  end
end
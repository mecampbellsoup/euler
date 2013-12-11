require 'prime'
require 'pry'
require 'awesome_print'

# A palindromic number reads the same both ways.
# The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

# Find the largest palindrome made from the product of two 3-digit numbers.

class Palindrome
  attr_reader :value, :string, :prime_factors

  def initialize(value)
    @value = value
    @string = self.value.to_s
    @prime_factors = self.prime_factors
    raise "#{value} is not a palindrome!" unless is_palindrome?
  end

  def is_palindrome?
    string.reverse == string
  end

  def prime_factors
    factors = self.value.prime_division
    factors.map { |a| [a.first] * a.last }.flatten
  end

  def is_biggest?(num_digits)
    # e.g. is_biggest?(2) => 
    start_at = ([9] * num_digits).join.to_i
    end_at = start_at.round(-1) * 0.9
    start_at.downto(end_at) do |i|
      # check next i if the result of dividing by the number check has more than num_digits of digits
      if (value/i).to_s.size > num_digits
        return false
      elsif value % i !=0
        next
      else
        return i
      end
    end
  end

end

# START TIMER!
start_time = Time.now

# I can start from the top (e.g. 100 in the 2-digit case) and return the first palindrome
factor_digits = 2

top = ([9] * factor_digits).join.to_i**2
bottom = ([9] * (factor_digits - 1)).join.to_i

biggest = top.downto(bottom) do |i|
  # begin/rescue so only palindromes get collected
  begin
    p = Palindrome.new(i)
  rescue
    next
  end
  checker = p.is_biggest?(factor_digits)
  break [p.value, checker] if checker
end

puts "The biggest palindrome with two #{factor_digits}-digit factors is: #{biggest.first}"
puts "Its two #{factor_digits}-digit factors are #{biggest.last} and #{biggest.first / biggest.last}"

# END TIMER!
puts "That took #{Time.now - start_time} seconds"
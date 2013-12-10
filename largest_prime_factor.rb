require 'pry'

# The prime factors of 13195 are 5, 7, 13 and 29.

# What is the largest prime factor of the number 600851475143 ?

class EulerPrimes
  attr_reader :number, :number_limit, :primes

  def initialize(number)
    @number = number
    @number_limit = (number**0.5).to_i
    @primes = []
    prime_factors
  end

  def prime_factors
    (2..self.number_limit).each { |num| number % num == 0 && prime?(num) ? self.primes.push(num) : next }
  end

  def prime?(num)

    return false if num.even? || num % 3 == 0 || num % 5 == 0
    (6..num**0.5).each do |n|
      next if n.even? || n % 3 == 0 || n % 5 == 0
      break false if num % n == 0
      true
    end
  end

  def largest_prime_factor
    self.primes.max
  end

end

test = EulerPrimes.new(600851475143)
p test.primes.max
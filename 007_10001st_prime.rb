require 'pry'

# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

# What is the 10 001st prime number?

class Sieve
  def self.primes_up_to(n)
    # this method will return the prime numbers up to n, whatever n is passed in
    all_values = (1..n).map { |i| NumChecker.new(i) }
    all_values.each do |i|
      if i.value == 1
        all_values[i.value - 1].prime = false
        next
      end
      if i.prime?
        # mark multiples as composite
        counter = 2
        while (counter * i.value) < n
          all_values[(counter * i.value) - 1].prime = false
          counter += 1
        end
      else
        next
      end
    end
      # if i is unmarked then it's prime
      # all unmarked numbers are prime!
    all_values.select { |i| i.prime? }
  end

  def nth_prime(n)
    # this method will return the nth prime in the sequence of prime numbers
    prime_counter = 0
    until (prime_counter >= n) do
      # Sieve magic here...
    end
  end

end

class NumChecker

  attr_reader :value
  attr_accessor :prime
  
  def initialize(value)
    @value = value
    @prime = true
  end

  def prime?
    self.prime ? true : false
  end
end

test = Sieve.primes_up_to(1_000_000)
puts "The 10,001st prime number is #{test[10_000].value}"
# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

# Find the sum of all the primes below two million.

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
        while (counter * i.value) <= n
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

end

class NumChecker

  attr_reader :value
  attr_accessor :prime
  
  def initialize(value)
    @value = value
    @prime = true
  end

  def prime?
    self.prime
  end
end

p Sieve.primes_up_to(2_000_000).size
p Sieve.primes_up_to(2_000_000).collect { |num| num.value }.inject { |result, elem| result  + elem }
require 'pry'
require 'benchmark'

# The following iterative sequence is defined for the set of positive integers:

# n → n/2 (n is even)
# n → 3n + 1 (n is odd)

# Using the rule above and starting with 13, we generate the following sequence:

# 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
# It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.

# Which starting number, under one million, produces the longest chain?

# NOTE: Once the chain starts the terms are allowed to go above one million.

class Collatz
  @@sequences = {}

  attr_reader :starting_num
  attr_accessor :sequence

  def initialize(starting_num)
    @starting_num = starting_num
  end

  def length
    self.sequence = [starting_num]
    while self.sequence.last != 1
      if @@sequences[sequence.last].nil?
        # if there's no value at that key, then do the logic of next step
        next_step
      else
        # if there is a sequence at that key, just combine that sequence to the sequence so far
        self.sequence = (self.sequence + @@sequences[sequence.last]).uniq
      end
    end
    # put the new sequence into our collection of sequences/ the class variable
    @@sequences[starting_num] = self.sequence
    # return the sequence length
    self.sequence.size
  end

  def next_step
    # check even or odd and return the next number
    sequence.last.odd? ? sequence.push(sequence.last * 3 + 1) : sequence.push(sequence.last/2)
  end

end

# Procedural method for finding the longest sequence up to a given number
def longest_sequence_up_to(num)
  biggest = Collatz.new(1)
  biggest_length = biggest.length

  1.upto(num) do |i|
    collatz = Collatz.new(i)
    collatz_length = collatz.length
    if collatz_length > biggest_length
      biggest = collatz
      biggest_length = collatz_length
    end
  end
  [biggest_length, biggest.starting_num]
end


values = [ 10**2, 10**6 ]
# values.each do |num|
#   Benchmark.bmbm(27) do |bm|
#     bm.report("the starting num that provides the longest sequence up to #{num}")   { longest_sequence_up_to(num) }
#   end
# end

time = Time.now
result = longest_sequence_up_to(values.last)
puts "#{result.last} as the start returns a Collatz of #{result.first} numbers"
puts "That took #{Time.now - time} seconds!"

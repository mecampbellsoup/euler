# If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9.
# The sum of these multiples is 23.

# Find the sum of all the multiples of 3 or 5 below 1000.

class EulerMultiples

  attr_reader :multiples, :limit

  def initialize(limit, *multiples)
    @multiples = multiples
    @limit = limit
  end

  def matches_below_limit
    matches = []
    self.multiples.map do |multiple|
      (1...self.limit).each { |n| n % multiple == 0 ? matches.push(n) : next }
    end
    matches.uniq
  end

  def sum
    # sum up the items in the array from matches_below_limit
    self.matches_below_limit.inject(0) { |value, enum| value + enum }
  end

end

project_euler = EulerMultiples.new(1000, 3, 5)
puts project_euler.sum
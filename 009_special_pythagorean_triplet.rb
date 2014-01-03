# A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,

# a^2 + b^2 = c^2
# For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.

# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc. 

def is_pythag_triplet?(a,b,c)
  a < b && b < c
end

def a_b_c_sum_to_1000?(a,b,c)
  a + b + c == 1000
end

def find_c(a,b)
  Math.sqrt(a**2 + b**2)
end

first = 100
second = 100
solution = nil

first.upto(1000) do |a|
  second.upto(1000) do |b|
    c = find_c(a,b)
    if is_pythag_triplet?(a, b, c) && a_b_c_sum_to_1000?(a, b, c)
      break solution = [a, b, c]
    end
  end
end

puts "The solution is #{solution}"
puts "The product of a, b, & c is #{solution.inject { |start, next_one| start * next_one }}"
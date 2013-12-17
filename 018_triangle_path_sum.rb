require 'pry'

class Triangle

  attr_reader :file, :data
  attr_accessor :biggest_path

  def initialize(path)
    @file = File.open(File.join(Dir.pwd, path))
    @data = flip_triangle
    @biggest_path = memoize
  end

  def parse_data
    file.each_line.map { |line| line.strip.split(" ").map &:to_i }
  end

  def flip_triangle
    parse_data.reverse
  end

  def memoize
    data.each_with_index do |row, row_index|
      next if row_index == 0
      row.each_with_index do |value, value_index|
        current = data[row_index][value_index]
        first = data[row_index - 1][value_index] + current
        second = data[row_index - 1][value_index + 1] + current
        bigger = first > second ? first : second
        data[row_index][value_index] = bigger
        return data[row_index][value_index] if row_index == data.size - 1
      end
    end
  end

end


small = Triangle.new('data/triangle_small.txt')
normal = Triangle.new('data/triangle.txt')
normal2 = Triangle.new('data/new_triangle.txt')
euler18 = Triangle.new('data/euler_problem_18.txt')
euler67 = Triangle.new('data/euler_problem_67.txt')
binding.pry
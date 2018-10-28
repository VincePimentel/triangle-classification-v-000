class Triangle
  attr_accessor :a, :b, :c, :x

  def initialize(a, b, c)
    @side_a = a
    @side_b = b
    @side_c = c
    @side_all = [@side_a, @side_b, @side_c]
  end

  def zero_or_negative?
    @side_all.include?(0) || @side_all.join.include?("-") ? true : false
  end

  def valid_triangle?
    @side_a + @side_b > @side_c && @side_b + @side_c > @side_a && @side_a + @side_c > @side_b && !zero_or_negative? ? true : false
  end

  def equilateral?
    valid_triangle? && @side_a == @side_b && @side_a == @side_c ? true : false
  end

  def isosceles?
    valid_triangle? && @side_all.sort[1] == @side_all.sort[2] ? true : false
  end

  def scalene?
    valid_triangle? && !equilateral? && !isosceles? ? true : false
  end

  def kind
    if !valid_triangle?
      raise TriangleError
    elsif equilateral?
      :equilateral
    elsif isosceles?
      :isosceles
    elsif scalene?
      :scalene
    end
  end

  class TriangleError < StandardError; end
end

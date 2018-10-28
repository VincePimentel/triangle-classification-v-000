class Triangle
  attr_accessor :a, :b, :c

  @@triangle = [@a, @b, @c].sort

  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end

  def valid_triangle?
    if @@triangle[0].to_i + @@triangle[1].to_i > @@triangle[2].to_i ||
      @@triangle[1].to_i + @@triangle[2].to_i > @@triangle[0].to_i ||
      @@triangle[0].to_i + @@triangle[2].to_i > @@triangle[1].to_i
      return true
    else
      return false
    end
  end

  def equilateral?
    valid_triangle? && @@triangle[0] == @@triangle[1] && @@triangle[0] == @@triangle[2] ? true : false
  end

  def isosceles?
    valid_triangle? && @@triangle[1] == @@triangle[2] ? true : false
  end

  def scalene?
    valid_triangle? && !equilateral? && !isosceles? ? true : false
  end



  def kind
    if equilateral?
      :equilateral
    elsif isosceles?
      :isosceles
    elsif scalene?
      :scalene
    else
      raise TriangleError
    end
  end

  class TriangleError < StandardError

  end
end

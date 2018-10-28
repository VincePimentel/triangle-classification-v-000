class Triangle
  attr_accessor :a, :b, :c

  @@triangle = [@a, @b, @c].sort

  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end

  def valid_triangle?
    if @@triangle[0] + @@triangle[1] > @@triangle[2] ||
      @@triangle[1] + @@triangle[2] > @@triangle[0] ||
      @@triangle[0] + @@triangle[2] > @@triangle[1]
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
    if !zero_or_negative?
      if isosceles?
        :isosceles
      elsif scalene?
        :scalene
      elsif equilateral?
        :scalene
      end
    else
      raise TriangleError
    end
  end

  class TriangleError < StandardError

  end
end

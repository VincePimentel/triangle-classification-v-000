class Triangle
  attr_accessor :a, :b, :c

  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end

  def kind
    if ![a, b, c].include?(0)
      if a == b || a == c || b == c
        return :isosceles
      elsif a != b && a != c
        return :scalene
      elsif [a, b, c] == [a] * 3
        return :equilateral
      end
    else
      raise TriangleError
    end
  end

  class TriangleError < StandardError

  end
end

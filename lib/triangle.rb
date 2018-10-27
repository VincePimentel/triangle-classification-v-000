class Triangle
  attr_accessor :a, :b, :c

  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end

  def kind
    if a != 0 || b != 0 || c != 0
      if a == b || a == c || b == c
        return :isosceles
      elsif a != b && a != c && b != c
        return :scalene
      elsif a == b && a == c && b == c
        return :equilateral
      end
    else
      raise TriangleError
    end
  end

  class TriangleError < StandardError

  end
end

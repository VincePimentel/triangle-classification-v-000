class Triangle
  attr_accessor :a, :b, :c

  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end

  def kind
    if ![a, b, c].any?(0)
      if a == b || a == c || b == c
        return :isosceles
      elsif a != b && a != c
        return :scalene
      elsif [a, b, c] == [a] * 3
        return :equilateral
      end
    elsif [a, b, c].any?(0)# || [a, b, c].join(" ").include?("-")
      raise TriangleError
    end
  end

  class TriangleError < StandardError

  end
end

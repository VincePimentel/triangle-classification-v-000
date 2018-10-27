class Triangle
  attr_accessor :a, :b, :c

  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end

  def zero_or_negative?
    [@a, @b, @c].join.include?(/[-|0]/) ? true : false
  end

  def isosceles?
    (@a == @b && @a != @c) || (@a == @c && @a != @b) || (@b == @c && @b != @a) ? true : false
  end

  def scalene?
    @a != @b && @a != @c && @b != @c ? true : false
  end

  def equilateral?
    @a == @b && @a == @c && @b == @c ? true : false
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

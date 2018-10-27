class Triangle
  attr_accessor :a, :b, :c

  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end

  def zero_or_negative?
    [@a, @b, @c].include?(0) || [@a, @b, @c].join.include?("-") ? true : false
  end

  def isosceles?
    side = [@a, @b, @c].sort
    side[0] == side[1] ? true : false
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

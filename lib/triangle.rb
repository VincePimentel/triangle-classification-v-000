class Triangle
  attr_accessor :a, :b, :c, :x

  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
    @x = [@a, @b, @c].sort
  end

  def zero_or_negative?
    [@a, @b, @c].include?(0) || [@a, @b, @c].join.include?("-") ? true : false
  end

  def valid_triangle?
    if @a + @b > @c && @b + @c > @a && @a + @c > @b && !zero_or_negative?
      return true
    else
      return false
    end
  end

  def equilateral?
    valid_triangle? && @a == @b && @a == @c ? true : false
  end

  def isosceles?
    valid_triangle? && @x[1] == @x[2] ? true : false
  end

  def scalene?
    valid_triangle? && !equilateral? && !isosceles? ? true : false
  end

  def kind
    if !valid_triangle?
      begin
        raise TriangleError
      rescue TriangleError => error
        puts error.message
      end
    elsif equilateral?
      :equilateral
    elsif isosceles?
      :isosceles
    elsif scalene?
      :scalene
    end
  end

  class TriangleError < StandardError
    def message
      "Invalid triangle!"
    end
  end
end

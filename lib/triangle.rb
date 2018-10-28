class Triangle
  attr_accessor :a, :b, :c, :s

  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
    @s = [@a, @b, @c].sort
  end

  def valid_triangle?
    def zero_or_negative?
      @s.include?(0) || @s.join.include?("-") ? true : false
    end

    if @s[0] + @s[1] > @s[2] && @s[1] + @s[2] > @s[0] && @s[0] + @s[2] > @s[1]
      return true
    else
      return false
    end
  end

  def equilateral?
    valid_triangle? && @s[0] == @s[1] && @s[0] == @s[2] ? true : false
  end

  def isosceles?
    valid_triangle? && @s[1] == @s[2] ? true : false
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

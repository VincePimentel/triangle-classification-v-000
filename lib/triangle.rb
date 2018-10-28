class Triangle
  attr_accessor :a, :b, :c, :x

  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
    @x = [@a, @b, @c]
  end

  def zero_or_negative?
    @x.include?(0) || @x.join.include?("-") ? true : false
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
    valid_triangle? && @x.sort[1] == @x.sort[2] ? true : false
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
    end
    
    if equilateral?
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

class Triangle
  attr_accessor :a, :b, :c

  @@triangle = Array.new

  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
    @@triangle = [@a, @b, @c].sort
  end

  def valid_triangle?
    if @@triangle[0].to_f + @@triangle[1].to_f > @@triangle[2].to_f
      return true
    elsif @@triangle[1].to_f + @@triangle[2].to_f > @@triangle[0].to_f
      return true
    elsif @@triangle[0].to_f + @@triangle[2].to_f > @@triangle[1].to_f
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

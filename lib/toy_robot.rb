$LOAD_PATH << '.'

require 'north'

class ToyRobot

  def initialize(x, y, f, input)
    @x = x
    @y = y
    @f = f
    @input = input
  end

  def place()
    coordinate = []
    if check_location(@x, @y)
      move_robot(coordinate = [@x, @y, @f])
    else
      puts "Wrong coordinate. Please try again"
    end
  end

  def check_location(x, y)
    if x * y > 25
      return false
    else
      return true
    end
  end

  def move_robot(coordinate)
    first_direction = coordinate[2]

    if first_direction == "North"
      result = North.move(@input, coordinate)
    end
    
    coordinate = result
  end
end

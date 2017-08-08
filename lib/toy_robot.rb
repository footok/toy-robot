$LOAD_PATH << '.'

require 'north'
require 'east'

class ToyRobot
  def initialize
    @coordinate = []
  end

  def read_input
    input_file = File.open("input.txt", "r")

    input_file.each do |i|
      if i.include? "PLACE"
        input = i.split(" ")[1].split(",")
       @coordinate = place(input)
      elsif i.include? "Report"
        p @coordinate
      else
        check_input(i.delete("\n"))
      end
    end
  end

  def place(input)
    x = input[0].to_i 
    y = input[1].to_i 
    f = input[2]
    coordinate = []

    if check_location(x, y)
      coordinate = [x, y, f]
    else
      coordinate
    end
  end

  def check_location(x, y)
    if x * y > 25
      return false
    elsif x > 5 || y > 5
      return false
    else
      return true
    end
  end

  def check_input(input)
    if @coordinate.length > 0
      if input == "Move"
        move_robot
      elsif input == "Left"
        left_handler
      elsif input == "Right"
        right_handler
      end
    end
  end

  def move_robot
    if @coordinate[2] == "North"
      @coordinate[1] += 1 unless @coordinate[1] >= 5
    elsif @coordinate[2] == "East"
      @coordinate[0] += 1 unless @coordinate[0] >= 5
    elsif @coordinate[2] == "West"
      @coordinate[0] -= 1 unless @coordinate[0] <= 0
    elsif @coordinate[2] == "South"
      @coordinate[1] -= 1 unless @coordinate[1] <= 0
    end
    @coordinate
  end

  def left_handler
    if @coordinate[2] == "North"
      @coordinate[2] = "West"
    elsif @coordinate[2] == "East"
      @coordinate[2] = "North"
    elsif @coordinate[2] == "West"
      @coordinate[2] = "South"
    elsif @coordinate[2] == "South"
      @coordinate[2] = "East"
    end
    @coordinate
  end

  def right_handler
    if @coordinate[2] == "North"
      @coordinate[2] = "East"
    elsif @coordinate[2] == "East"
      @coordinate[2] = "South"
    elsif @coordinate[2] == "West"
      @coordinate[2] = "North"
    elsif @coordinate[2] == "South"
      @coordinate[2] = "West"
    end
    @coordinate
  end

end

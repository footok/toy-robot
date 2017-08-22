class PlaceHandler
  def initialize(coordinate)
    @coordinate = coordinate
  end

  def parse(input)
    coordinate = input.gsub(',', ' ').split
    if check_coordinate_validation(coordinate)
      x, y, f = coordinate[1].to_i, coordinate[2].to_i, coordinate[3]
      place_robot(x, y, f)
    else
      puts 'Invalid PLACE command: Please try again'
    end
  end

  def place_robot(x, y, f)
    @coordinate.robot_coordinate = [x, y, f]
  end

  def check_coordinate_validation(coordinate)
    if coordinate.length > 0
      if coordinate[1] =~ /[0-5]/ && coordinate[2] =~ /[0-5]/ && coordinate[3] =~ /(NORTH|SOUTH|EAST|WEST)/
        return true
      else
        return false
      end
    end
  end
end

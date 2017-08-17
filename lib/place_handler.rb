class PlaceHandler
  def initialize(coordinate)
    @coordinate = coordinate
  end

  def parse(input)
    coordinate = input.split(' ')[1].split(',')
    x, y, f = coordinate[0].to_i, coordinate[1].to_i, coordinate[2]
    place_robot(x, y, f) if x >= 0 && x <= 5 && y >= 0 && y <= 5
  end

  def place_robot(x, y, f)
    @coordinate.robot_coordinate = [x, y, f]
  end
end

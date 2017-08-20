class MoveHandler
  def initialize(coordinate)
    @coordinate = coordinate
  end

  def execute
    coordinate = @coordinate.robot_coordinate

    if @coordinate.exists && coordinate_valid(coordinate)
      direction = coordinate[2]
      if direction == 'NORTH'
        coordinate[1] += 1
      elsif direction == 'SOUTH'
        coordinate[1] -= 1
      elsif direction == 'EAST'
        coordinate[0] += 1
      elsif direction == 'WEST'
        coordinate[0] -= 1
      end
    end
  end

  def coordinate_valid(coordinate)
    x, y, f = coordinate[0], coordinate[1], coordinate[2]
    if f == 'NORTH'
      y < 5
    elsif f == 'SOUTH'
      y > 0
    elsif f == 'EAST'
      x < 5
    elsif f == 'WEST'
      x > 0
    end
  end
end

class LeftHandler

  DIRECTIONS = %w(NORTH EAST SOUTH WEST)

  def initialize(coordinate)
    @coordinate = coordinate
  end

  def execute
    coordinate = @coordinate.robot_coordinate
    if @coordinate.exists
      current_direction = coordinate[2]
      new_direction = DIRECTIONS[(DIRECTIONS.index(current_direction) - 1) % 4]
      coordinate[2] = new_direction
    end
  end
end

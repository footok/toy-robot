class LeftHandler

  DIRECTIONS = %w(NORTH EAST SOUTH WEST)

  def initialize(coordinate)
    @coordinate = coordinate
  end

  def execute
    coordinate = @coordinate.robot_coordinate
    current_direction = coordinate[2]

    if @coordinate.exists
      new_direction = DIRECTIONS[(DIRECTIONS.index(current_direction) - 1) % 4]
      coordinate[2] = new_direction
    end
  end
end

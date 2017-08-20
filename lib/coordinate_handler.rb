class CoordinateHandler
  attr_accessor :robot_coordinate

  def initialize
    @robot_coordinate = nil
    @empty_coordinate_message = "Robot has not placed yet"
  end

  def report
    if exists
      @robot_coordinate
    else
      @empty_coordinate_message
    end
  end

  def exists
    !@robot_coordinate.nil?
  end
end

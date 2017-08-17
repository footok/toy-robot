class CoordinateHandler
  attr_accessor :robot_coordinate

  def initialize
    @robot_coordinate = nil
  end

  def report
    puts @robot_coordinate
  end

  def placed?
    !@robot_coordinate.nil?
  end
end

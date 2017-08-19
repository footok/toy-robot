class CoordinateHandler
  attr_accessor :robot_coordinate

  def initialize
    @robot_coordinate = nil
  end

  def report
    if exists
      @robot_coordinate
    else
      puts 'Robot has not placed yet'
    end
  end

  def exists
    !@robot_coordinate.nil?
  end
end

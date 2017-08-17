class ReportHandler
  attr_accessor :robot_coordinate

  def initialize(coordinate)
    @coordinate = coordinate
  end

  def execute
    puts @coordinate.report
  end
end

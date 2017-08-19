class ReportHandler

  def initialize(coordinate)
    @coordinate = coordinate
  end

  def execute
    puts @coordinate.report
    @coordinate.report
  end
end

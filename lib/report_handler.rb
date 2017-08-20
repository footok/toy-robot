class ReportHandler

  def initialize(coordinate)
    @coordinate = coordinate
  end

  def execute
    p @coordinate.report
  end
end

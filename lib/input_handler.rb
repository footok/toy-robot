class InputHandler

  def initialize(coordinate)
    @coordinate = coordinate
  end

  def parse(input)
    if input.include? 'PLACE'
      place = PlaceHandler.new(@coordinate)
      place.parse(input)
    elsif input.include? 'REPORT'
      report = ReportHandler.new(@coordinate)
      report.execute
    end
  end
end

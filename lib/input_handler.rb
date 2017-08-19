class InputHandler

  def initialize(coordinate)
    @coordinate = coordinate
  end

  def parse(input)
    if input.include? 'PLACE'
      place = PlaceHandler.new(@coordinate)
      place.parse(input)
    elsif input == 'MOVE'
      move = MoveHandler.new(@coordinate)
      move.execute
    elsif input == 'LEFT'
      left = LeftHandler.new(@coordinate)
      left.execute
    elsif input == 'RIGHT'
      right = LeftHandler.new(@coordinate)
      right.execute
    elsif input == 'REPORT'
      report = ReportHandler.new(@coordinate)
      report.execute
    end
  end
end

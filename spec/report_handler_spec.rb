require 'place_handler'
require 'coordinate_handler'
require 'report_handler'

describe ReportHandler do
  let(:coordinate) { CoordinateHandler.new }
  let(:place_handler) { PlaceHandler.new(coordinate) }
  let(:report_handler) { ReportHandler.new(coordinate) }

  describe '#execute' do
    it 'prints coordinate' do
      place_handler.place_robot(0, 0, 'NORTH')
      expect(report_handler.execute).to eql([0, 0, 'NORTH'])
    end

    it 'returns nil when coordinate is nil' do
      expect(report_handler.execute).to eql('Robot has not placed yet')
    end
  end
end

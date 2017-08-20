require 'place_handler'
require 'coordinate_handler'

describe CoordinateHandler do
  let(:coordinate) { CoordinateHandler.new }
  let(:place_handler) { PlaceHandler.new(coordinate) }
  let(:report_handler) { ReportHandler.new(coordinate) }

  describe '#report' do
    it 'returns corrdinate if it exists' do
      coordinate.robot_coordinate = [0, 0, 'NORTH']
      expect(coordinate.report).to eql([0, 0, 'NORTH'])
    end

    it 'prints message when coordinate is not exists' do
      expected_report = "Robot has not placed yet\n"
      expect { coordinate.report }.to output(expected_report).to_stdout
    end
  end
end

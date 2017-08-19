require 'move_handler'
require 'place_handler'
require 'report_handler'
require 'coordinate_handler'

describe MoveHandler do
  let(:coordinate) { CoordinateHandler.new }
  let(:move_handler) { MoveHandler.new(coordinate) }
  let(:place_handler) { PlaceHandler.new(coordinate) }
  let(:report_handler) { ReportHandler.new(coordinate) }

  describe '#execute' do
    it 'moves robot one step towards to the direction where it facing currently' do
      place_handler.place_robot(0, 0, 'NORTH')
      move_handler.execute
      expect(report_handler.execute).to eql([0, 1, 'NORTH'])
    end
  end

  describe '#coordinate_valid' do
    context 'checks whether the current coordinate is within table (5,5)' do
      it 'returns true when robot can move' do
        coordinate = [4, 4, 'NORTH']
        expect(move_handler.coordinate_valid(coordinate)).to eql(true)
      end

      it 'returns false when robot cannot move' do
        coordinate = [4, 5, 'NORTH']
        expect(move_handler.coordinate_valid(coordinate)).to eql(false)
      end
    end
  end
end

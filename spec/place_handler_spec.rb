require 'input_handler'
require 'place_handler'
require 'coordinate_handler'
require 'report_handler'

describe PlaceHandler do
  let(:coordinate) { CoordinateHandler.new }
  let(:place_handler) { PlaceHandler.new(coordinate) }

  describe '#parse' do
    valid_input1 = 'PLACE 0, 0, NORTH'
    valid_input2 = 'PLACE 1,3,EAST'
    invalid_input = 'PLACE 6, 6, NORTH'

    it 'it checks input and assign to x, y and f' do
      expect(place_handler.parse(valid_input1)).to eql([0, 0, 'NORTH'])
      expect(place_handler.parse(valid_input2)).to eql([1, 3, 'EAST'])
    end

    it 'does not set coordinate when input is invalid' do
      expect(place_handler.parse(invalid_input)).to eql(nil)
    end
  end

  describe '#place_robot' do
    it 'assign arguments to @coordinate.robot_coordinate' do
      expect(place_handler.place_robot(2, 3, 'NORTH')).to eql([2, 3, 'NORTH'])
    end
  end
end

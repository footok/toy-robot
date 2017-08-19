require 'input_handler'
require 'place_handler'
require 'coordinate_handler'
require 'report_handler'

describe InputHandler do
  let(:coordinate) { CoordinateHandler.new }
  let(:input_handler) { InputHandler.new(coordinate) }

  describe '#parse' do
    context 'when input includes PLACE' do
      valid_input = 'PLACE 0, 0, NORTH'
      invalid_input = 'PLACE 2, 6, NORTH'

      it 'set coordinate values for robot when input is valid' do
        expect(input_handler.parse(valid_input)).to eql([0, 0, 'NORTH'])
      end

      it 'does not set coordinate when input is invalid' do
        expect(input_handler.parse(invalid_input)).to eql(nil)
      end
    end

    context 'when input includes REPORT' do
      input = 'REPORT'

      it 'displays current position of robot' do
        coordinate.robot_coordinate = [1, 2, 'NORTH']
        expect(input_handler.parse(input)).to eq([1, 2, 'NORTH'])
      end
    end
  end
end

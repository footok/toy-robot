require 'input_handler'
require 'report_handler'
require 'place_handler'
require 'move_handler'
require 'coordinate_handler'
require 'left_handler'
require 'right_handler'

describe InputHandler do
  let(:coordinate) { CoordinateHandler.new }
  let(:input_handler) { InputHandler.new(coordinate) }
  let(:place_handler) { PlaceHandler.new(coordinate) }
  let(:move_handler) { MoveHandler.new(coordinate) }
  let(:report_handler) { ReportHandler.new(coordinate) }

  describe '#parse' do
    context 'when input includes PLACE' do
      place_input = 'PLACE 0, 0, NORTH'
      invalid_place_input = 'PLACE 2, 6, NORTH'

      it 'set coordinate values for robot when input is valid' do
        expect(input_handler.parse(place_input)).to eql([0, 0, 'NORTH'])
      end

      it 'does not set coordinate when input is invalid' do
        expect(input_handler.parse(invalid_place_input)).to eql(nil)
      end
    end

    context 'when input is MOVE' do
      input = 'MOVE'

      it 'moves robot towards its current direction' do
        place_handler.place_robot(0, 0, 'NORTH')
        input_handler.parse(input)
        expect(report_handler.execute).to eql([0, 1, 'NORTH'])
      end

      it 'returns nil when robot is not placed yet' do
        expect(input_handler.parse(input)).to eql nil
      end
    end

    context 'when input is LEFT' do
      input = 'LEFT'
      it 'changes direction NORTH to WEST' do
        place_handler.place_robot(0, 0, 'NORTH')
        input_handler.parse(input)
        expect(report_handler.execute).to eql([0, 0, 'WEST'])
      end

      it 'returns nil when robot is not placed yet' do
        expect(input_handler.parse(input)).to eql nil
      end
    end

    context 'when input is RIGHT' do
      input = 'RIGHT'
      it 'changes direction NORTH to EAST' do
        place_handler.place_robot(0, 0, 'NORTH')
        input_handler.parse(input)
        expect(report_handler.execute).to eql([0, 0, 'EAST'])
      end

      it 'returns nil when robot is not placed yet' do
        expect(input_handler.parse(input)).to eql nil
      end
    end

    context 'when input is REPORT' do
      input = 'REPORT'

      it 'displays current position of robot' do
        coordinate.robot_coordinate = [1, 2, 'NORTH']
        expect(input_handler.parse(input)).to eq([1, 2, 'NORTH'])
      end
    end

    context 'when input is invalid' do
      input = 'invalid'

      it 'prints invalid command message' do
        invalid_command_message = "Invalid command: Please try again\n"
        expect { input_handler.parse(input) }.to output(invalid_command_message).to_stdout
      end
    end
  end
end

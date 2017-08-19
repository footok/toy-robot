require 'place_handler'
require 'coordinate_handler'
require 'right_handler'

describe RightHandler do
  let(:coordinate) { CoordinateHandler.new }
  let(:place_handler) { PlaceHandler.new(coordinate) }
  let(:right_handler) { RightHandler.new(coordinate) }

  describe '#execute' do
    context 'change current direction to its right side' do

      it 'changes direction NORTH to EAST' do
        place_handler.place_robot(0, 0, 'NORTH')
        expect(right_handler.execute).to eql('EAST')
      end

      it 'changes direction EAST to SOUTH' do
        place_handler.place_robot(0, 0, 'EAST')
        expect(right_handler.execute).to eql('SOUTH')
      end

      it 'changes direction SOUTH to WEST' do
        place_handler.place_robot(0, 0, 'SOUTH')
        expect(right_handler.execute).to eql('WEST')
      end

      it 'changes direction WEST to NORTH' do
        place_handler.place_robot(0, 0, 'WEST')
        expect(right_handler.execute).to eql('NORTH')
      end
    end
  end
end

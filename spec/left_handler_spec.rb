require 'place_handler'
require 'coordinate_handler'
require 'left_handler'

describe LeftHandler do
  let(:coordinate) { CoordinateHandler.new }
  let(:place_handler) { PlaceHandler.new(coordinate) }
  let(:left_handler) { LeftHandler.new(coordinate) }

  describe '#execute' do
    context 'change current direction to its left side' do

      it 'changes direction NORTH to WEST' do
        place_handler.place_robot(0, 0, 'NORTH')
        expect(left_handler.execute).to eql('WEST')
      end

      it 'changes direction EAST to NORTH' do
        place_handler.place_robot(0, 0, 'EAST')
        expect(left_handler.execute).to eql('NORTH')
      end

      it 'changes direction SOUTH to EAST' do
        place_handler.place_robot(0, 0, 'SOUTH')
        expect(left_handler.execute).to eql('EAST')
      end

      it 'changes direction WEST to SOUTH' do
        place_handler.place_robot(0, 0, 'WEST')
        expect(left_handler.execute).to eql('SOUTH')
      end
    end
  end
end

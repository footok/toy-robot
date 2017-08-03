require 'toy_robot'

describe ToyRobot do
  before do
    @robot = ToyRobot.new(2, 3, "North", ["Move"])
  end

  let(:direction) { "North" }
  let(:coordinate) { [2, 4, "North"]}

  describe "place" do
    it "set starting point" do
      expect(@robot.place).to eql(coordinate)
    end
  end

  describe "place" do
    xit "set starting point" do
      expect(ToyRobot.this_place(2, 4, direction)).to eql(true)
    end

    context "move a toy" do
      xit "and reports its current position" do
        expect(ToyRobot.move(2, 4)).to eql(0)
      end
    end
  end

  describe "check_location" do
    context "checks location and does not move a toy" do
      xit "when it is out of given table" do
        expect(ToyRobot.this_check_location(4, 7)).to eql(false)
      end
    end
  end
end

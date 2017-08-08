require 'toy_robot'

describe ToyRobot do
  before do
    @robot = ToyRobot.new()
  end

  let(:coordinate) { [2, 2, "North"]}

  describe "place" do
    it "sets coordinate when an input from file contains PLACE" do
      expect(@robot.place([2, 2, "North"])).to eql(coordinate)
    end

    it "does not sets coordinate when an input is out of range" do
      expect(@robot.place([6, 4, "North"])).to eql([])
    end
  end

  describe "check_location" do
    it "return false when a coordinate is out of the table" do
      expect(@robot.check_location(6, 7)).to eql false
    end

    it "return false when a coordinate is out of the table" do
      expect(@robot.check_location(6, 0)).to eql false
    end

    it "return false when a coordinate is out of the table" do
      expect(@robot.check_location(0, 6)).to eql false
    end

    it "return true when initial coordinate is within the table" do
      expect(@robot.check_location(0, 0)).to eql true
    end
  end

  describe "move_robot" do
    it "moves robot based on where it facing" do
      @robot.instance_variable_set(:@coordinate, [3, 2, "North"])
      expect(@robot.move_robot).to eql [3, 3, "North"]
    end

    it "moves robot based on where it facing" do
      @robot.instance_variable_set(:@coordinate, [3, 2, "East"])
      expect(@robot.move_robot).to eql [4, 2, "East"]
    end
  end

  describe "left_handler" do
    it "changes direction based on current facing direction" do
      @robot.instance_variable_set(:@coordinate, [3, 2, "North"])
      expect(@robot.left_handler).to eql [3, 2, "West"]
    end

    it "changes direction based on current facing direction" do
      @robot.instance_variable_set(:@coordinate, [3, 2, "East"])
      expect(@robot.left_handler).to eql [3, 2, "North"]
    end
  end

  describe "right_handler" do
    it "changes direction based on current facing direction" do
      @robot.instance_variable_set(:@coordinate, [3, 2, "North"])
      expect(@robot.right_handler).to eql [3, 2, "East"]
    end

    it "changes direction based on current facing direction" do
      @robot.instance_variable_set(:@coordinate, [3, 2, "East"])
      expect(@robot.right_handler).to eql [3, 2, "South"]
    end
  end

end

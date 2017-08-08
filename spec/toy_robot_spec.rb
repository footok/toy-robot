require 'toy_robot'

describe ToyRobot do
  before do
    @robot = ToyRobot.new()
    @robot_with_report = ToyRobot.new()
    @robot_wrong_coordinate = ToyRobot.new()
    @robot_out_of_range = ToyRobot.new()
  end

  let(:direction) { "North" }
  let(:input) { ["Move", "PLACE 2,2,North", "Move", "Right", "Move", "Report"] }
  let(:coordinate1) { [2, 2, "North"]}
  let(:coordinate) { [3, 4, "East"]}
  let(:coordinate_with_report) { [3, 2, "North"]}
  let(:coordinate_with_out_of_range) { [4, 5, "West"]}

  describe "read_input" do
    it "reads input file" do
      expect(@robot.place([2, 2, "North"])).to eql(coordinate1)
    end
  end

  describe "place" do
    it "sets coordinate when an input from file contains PLACE" do
      expect(@robot.place([2, 2, "North"])).to eql(coordinate1)
    end

    it "does not sets coordinate when an input is out of range" do
      expect(@robot.place([6, 4, "North"])).to eql([])
    end

#    it "reports its current position" do
#      expect(@robot_with_report.place).to eql(coordinate_with_report) 
#    end
#    it "does not move robot out of the table" do
#      expect(@robot_out_of_range.place).to eql(coordinate_with_out_of_range)
#    end
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

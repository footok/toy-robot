require_relative 'lib/input_handler'
require_relative 'lib/place_handler'
require_relative 'lib/coordinate_handler'
require_relative 'lib/report_handler'
require_relative 'lib/move_handler'
require_relative 'lib/left_handler'

class ToyRobot

  coordinate = CoordinateHandler.new
  input_handler = InputHandler.new(coordinate)

  loop do
    puts "Please enter commands (enter EXIT to quit): "
    input = gets.delete("\n").upcase
    input_handler.parse(input)

    break if input == 'EXIT'
  end
end

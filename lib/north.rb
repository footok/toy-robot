module North
  def self.move(input, coordinate)
    input.each do |i|
      if i == 'Move'
        coordinate[1] += 1
      elsif i == 'Left'
        coordinate[2] = 'Left'
      elsif i == 'Right'
        coordinate[2] = 'Right'
      elsif i == 'Report'
        coordinate.each do |c|
          puts c
        end
      else 
        puts 'Wrong command.'
      end
    end

    coordinate
  end
end

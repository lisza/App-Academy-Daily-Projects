require 'colorize'
require_relative 'cursor.rb'
require_relative 'board.rb'

class Display
  attr_reader :cursor
  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  def render
    @board.grid.each_with_index do |row, i|
      row.each_with_index do |tile, j|
        at_cursor = [i,j] == @cursor.cursor_pos
        if tile.is_a?(Piece)
          at_cursor ? to_print = "P ".colorize(:green) : to_print = "P "
        else
          at_cursor ? to_print = "# ".colorize(:green) : to_print =  "# "
        end
        print to_print
      end
      puts
    end
    puts
  end

  def move_cursor
    self.render
    @cursor.get_input
  end
end

if __FILE__ == $PROGRAM_NAME
  board = Board.new
  display = Display.new(board)

  loop { display.move_cursor }
end

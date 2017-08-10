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

        if at_cursor
          if @cursor.selected
            print tile.symbol.to_s.colorize(:red) + " "
          else
            print tile.symbol.to_s.colorize(:green) + " "
          end
        else
          print tile.symbol.to_s + " "
        end

      end
      puts
    end
    puts
  end

  def move_cursor
    self.render
    @cursor.get_input
    system("clear")
  end
end

if __FILE__ == $PROGRAM_NAME
  board = Board.new
  display = Display.new(board)

  loop { display.move_cursor }
end

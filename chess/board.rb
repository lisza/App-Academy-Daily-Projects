require_relative 'piece.rb'


class Board
attr_reader :grid

  def initialize
    arr1 = Array.new(2) { Array.new(8) { Piece.new } }
    arr2 = Array.new(4) { Array.new(8) }
    arr3 = Array.new(2) { Array.new(8) { Piece.new } }
    @grid = arr1 + arr2 + arr3
    #@pieces = pieces
  end

  def move_piece(start_pos, end_pos)
    if self[start_pos].nil?
      raise "STaRT POiITsiON IS EMsPTY"

      #gets the piece at start_pos, checks if Piece#moves method include the end_pos.
      #raises error if not
    elsif !self[start_pos].moves.include?(end_pos)
      raise "NOT A VALID MOVE SUCKA"
    end

    self[end_pos] = self[start_pos]
    self[start_pos] = nil
  end

  def in_bounds?(pos)
    x, y = pos
    return true if x.between?(0,7) && y.between?(0,7)
    false
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, value)
    x, y = pos
    @grid[x][y] = value
  end
end

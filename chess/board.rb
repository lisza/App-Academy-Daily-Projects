require_relative 'piece.rb'


class Board
attr_reader :grid
attr_accessor :move_positions
  def initialize
    @grid = Array.new(8) { Array.new(8) { Rook.new(self, :white) } }
    @move_positions = []
    # @pieces = pieces
  end

  def move_piece(start_pos, end_pos)
    if self[start_pos].nil? #change nil to NullPiece once we have pieces
      raise "STaRT POiITsiON IS EMsPTY"
    # elsif !(self[start_pos].moves.include?(end_pos))
    #   raise "NOT A VALID MOVE SUCKA"
    elsif !in_bounds?(end_pos)
      raise "OUT OF BOUNDS!!"
    end

    self[end_pos], self[start_pos] = self[start_pos], self[end_pos]
    self[end_pos].position = end_pos
    # p [self[start_pos], self[end_pos]]
  end

  def occupied?(pos)
    puts "self: #{self}"
    puts "pos: #{pos}"
    puts self[pos]
    return false if self[pos] #.is_a?(NullPiece)
    true
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

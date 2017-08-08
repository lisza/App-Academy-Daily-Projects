class Piece
  attr_reader :position

  def initialize(position, board = Board.new, color, symbol)
    @position = position
    @board = board
    @color = color
    @symbol = symbol
  end

  def moves
  end
end

module SlidingPiece
  def moves
  end
end

module SteppingPiece
  # def moves
  #   possible_moves = []
  #   MOVE_DIFFS.each do |key, val|
  #     x = val[0] + @position[0]
  #     y = val[1] + @position[1]
  #     possible_moves << [x, y]
  #   end
  #   p possible_moves
  #   moves = []
  #
  # end
end

class Rook < Piece
  include SlidingPiece

  def move_dirs
    [:horizontal, :vertical]
  end
end

class King < Piece
  MOVE_DIFFS = {
    left: [0, -1],
    right: [0, 1],
    up: [-1, 0],
    down: [1, 0],
    left_up: [-1,-1],
    right_up: [-1, 1],
    left_down: [1, -1],
    right_down: [1, 1]
  }

  include SteppingPiece
  attr_reader :symbol

  def initialize(position, board, color, symbol)
    @color = color

    if color == :white
      @position = [7,3]
    else
      @position = [0,3]
    end

    @symbol = :K

    #super
  end

  def moves
    possible_moves = []
    MOVE_DIFFS.each do |key, val|
      x = val[0] + @position[0]
      y = val[1] + @position[1]
      possible_moves << [x, y]
    end

    possible_moves = possible_moves.select do |pos|
      @board.in_bounds?(pos) #&& @board[pos].color != @color
    end
  end


end

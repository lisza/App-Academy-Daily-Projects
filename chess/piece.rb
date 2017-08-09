require 'singleton'

class Piece
  attr_reader :position, :symbol

  def initialize(board = Board.new, color)
    @position = position
    @board = board
    @color = color
    @symbol = symbol
  end

  def moves
  end
end

module SlidingPiece
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

  attr_reader :symbol
  attr_accessor :position

  def moves(move_dirs = @move_dirs)

    basic_moves = {}
    # iterate over move_dirs and get all corresponding moves from MOVE_DIFFS
    move_dirs.each do |dir|
      basic_moves[dir] = [MOVE_DIFFS[dir][0] + @position[0],
                        MOVE_DIFFS[dir][1] + @position[1]]
    end

    moves = []
    basic_moves.each do |dir, basic_pos|
      pos = basic_pos
      puts "pos: #{pos}"
      until @board.occupied?(pos) || !@board.in_bounds?(pos)
        moves << pos.dup
        pos[0] += MOVE_DIFFS[dir][0]
        pos[1] += MOVE_DIFFS[dir][1]
      end
    end

    moves
  end
end

module SteppingPiece
  # Not currently in use, maybe refactor #moves out of King and Knight
end

class Rook < Piece
  include SlidingPiece

  def initialize(board, color)
    @color = color
    @color == :white ? @symbol = "♖" : @symbol = "♜"
    @position = [7,0]
    @move_dirs = [:left, :right, :up, :down]
    @board = board
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

  attr_reader :symbol
  attr_accessor :position

  def initialize(color)
    @color = color
    @position = [7,3]
    color == :white ? @symbol = "♔" : @symbol = "♚"
  end

  def moves
    possible_moves = []
    MOVE_DIFFS.each do |key, val|
      x = val[0] + @position[0]
      y = val[1] + @position[1]
      possible_moves << [x, y]
    end

    possible_moves
  end
end

class Knight < Piece
  MOVE_DIFFS = {up_left: [-1, -2],
                up_right: [-1, 2],
                down_left: [1, -2],
                down_right: [1, 2],
                left_up: [-2, -1],
                right_up: [-2, 1],
                left_down: [2, -1],
                right_down: [2, 1]
                }

  attr_reader :symbol
  attr_accessor :position

  def initialize(color)
    @color = color
    @position = [7,1]
    color == :white ? @symbol = "♘" : @symbol = "♞"
  end

  def moves
    possible_moves = []
    MOVE_DIFFS.each do |key, val|
      x = val[0] + @position[0]
      y = val[1] + @position[1]
      possible_moves << [x, y]
    end

    possible_moves
  end
end

class NullPiece < Piece
  include Singleton
  attr_reader :color, :symbol
    def initialize
      @color = :grey
      @symbol = :N
    end

end

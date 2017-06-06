require_relative 'piece'
require_relative 'nullpiece'

class Board
  attr_accessor :grid

  def self.empty_grid
    first_two_row = Array.new(2) { Array.new(8, Piece.new) }
    middle = Array.new(4) { Array.new(8, NullPiece.new) }
    last_two_row = Array.new(2) { Array.new(8, Piece.new) }
    first_two_row + middle + last_two_row
  end

  def initialize(grid = Board.empty_grid)
    @grid = grid
  end

  def move_piece(start_pos, end_pos)

    if !self[start_pos].is_a?(NullPiece) && self[end_pos].is_a?(NullPiece)
      self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
    else
      raise StandardError
    end
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @grid[row][col] = value
  end
end

b = Board.new()
p b
start_pos = 3,3
end_pos = 4,4
b.move_piece(start_pos,end_pos)
p b
# p b.move_piece([0,0], [1,1])
# p b.move_piece([3,3], [4,4])

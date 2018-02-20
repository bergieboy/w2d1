require_relative 'piece'
require 'byebug'

class Board
  attr_accessor :board


  def initialize
    @board = Array.new(8) { Array.new(8) }
    populate
  end

  def [](pos)
    row, col = pos
    board[row][col]
  end

  def []=(pos, piece)
    row, col = pos
    board[row][col] = piece
  end

  def populate
    board[0..1].each_index do |i|
      board[i].each_index do |j|
        self[[i, j]] = Piece.new #top
        self[[(i + 6), j]] = Piece.new #bottom
      end
    end
  end

  def move_piece(start_pos, end_pos)
    raise MoveError.new("There is no piece at start position") if board[start_pos].nil?
    raise MoveError.new("Cannot move to chosen end position") unless valid_move?(end_pos)

    self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
  end

  def valid_move?(pos)
    true
  end


end

class MoveError < StandardError
end

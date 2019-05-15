require_relative "piece"

class Pawn < Piece

  def symbol
    '♟'.colorize(color)
  end

  def name
    "pawn"
  end

  def moves
    p forward_steps + side_attacks
  end

  def at_start_pos?
    start_pos = (@color == :white) ? 6 : 1
    @pos[0] == start_pos
  end

  def side_attacks
    possible_moves = []
    row, col = @pos
    dy = (@color == :white) ? -1 : 1
    row += dy
    [-1, 1].each do |dx|
      if !@board[row, col].empty? && @board[row,col + dx].color != @color
        possible_moves << [row,col + dx]
      end
    end
    possible_moves.select {|pos| valid_move?(pos)}
  end

  def forward_steps
    possible_moves = []
    row, col = @pos
    dy = (@color == :white) ? -1 : 1
    row += dy
    if @board[row, col].empty?
      possible_moves << [row,col]
    else
      return possible_moves
    end

    if at_start_pos?
      row += dy
      if @board[row, col].empty?
        possible_moves << [row,col]
      else
        return possible_moves
      end
    end

    possible_moves.select {|pos| valid_move?(pos)}
  end
end
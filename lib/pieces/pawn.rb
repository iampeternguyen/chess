require_relative "piece"

class Pawn < Piece

  def symbol
    '♟'.colorize(color)
  end

  def name
    "pawn"
  end

  def moves
    forward_steps #+ side_attacks
  end

  def at_start_pos?
    @pos[0] == (@color == :white) ? 6 : 1
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

    possible_moves
  end
end
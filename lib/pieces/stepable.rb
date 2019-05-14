module Stepable
  def moves
    valid_moves = []

    cur_x, cur_y = @pos
    move_diffs.each do |(dx, dy)|
      new_pos = [cur_x + dx, cur_y + dy]
      # next unless board[new_pos].empty?

      if new_pos.all? { |coord| coord.between?(0, 7) }
        valid_moves << new_pos
      end
    end

    valid_moves
  end

  def move_diffs
    # subclass implements this with unicode chess char
    raise NotImplementedError
  end
end
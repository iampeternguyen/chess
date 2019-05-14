module Slideable
  def moves
    valid_moves = []
    straight_moves = [[1,0],[0,1],[-1,0],[0,-1]]
    diagonal_moves = [[1,1],[1,-1],[-1,1],[-1,-1]]

    case move_dir
    when :straight

      straight_moves.each do |delta|
        valid_moves += get_available_spaces(delta)
      end
    when :diagonal
      diagonal_moves.each do |delta|
        valid_moves += get_available_spaces(delta)
      end
    when :queen
      moves = straight_moves + diagonal_moves
      moves.each do |delta|
        valid_moves += get_available_spaces(delta)
      end
    end
    valid_moves
  end

  def get_available_spaces(delta)
    cur_x, cur_y = @pos
    dx, dy = delta
    valid_moves = []
    (1..7).each do |time|
      new_pos = [cur_x + dx*time, cur_y + dy *time]
      if valid_move?(new_pos)
        valid_moves << new_pos
      else
        return valid_moves
      end
    end
    valid_moves
  end

  def move_dir
    # subclass implements this with unicode chess char
    raise NotImplementedError
  end
end
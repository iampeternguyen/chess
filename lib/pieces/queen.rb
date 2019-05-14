require 'colorize'
require_relative 'piece'
require_relative 'slideable'

class Queen < Piece
  include Slideable

  def symbol
    '♕'.colorize(color)
  end

  def move_dir
    :queen
  end

  def name
    "queen"
  end

end
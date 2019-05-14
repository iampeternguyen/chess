require 'colorize'
require_relative 'piece'
require_relative 'slideable'

class Bishop < Piece
  include Slideable

  def symbol
    '♗'.colorize(color)
  end

  def move_dir
    :diagonal
  end

  def name
    "bishop"
  end

end
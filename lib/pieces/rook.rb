require 'colorize'
require_relative 'piece'
require_relative 'slideable'

class Rook < Piece
  include Slideable

  def symbol
    '♜'.colorize(color)
  end

  def move_dir
    :straight
  end

  def name
    "rook"
  end

end
require_relative "./lib/board.rb"
require_relative "./lib/display.rb"

class Chess
  def initialize
    @board = Board.new
    @display = Display.new(board)
    @game_over = false
  end

  def play
    until @game_over
      @display.render
      @display.cursor.get_input
    end
  end

  private
  attr_reader :board, :display

end


game = Chess.new
game.play
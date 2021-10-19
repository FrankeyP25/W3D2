require_relative "./board.rb"
require_relative "./human_player.rb"

require "byebug"

class Game
    attr_reader :board
    def initialize(board_length)
        @board = Board.new(board_length)
        @previous_pos = nil
        @player = HumanPlayer.new


    end

    def play
        while !@board.won?
            @board.render
            guessed_position = @player.get_position
            make_guess(guessed_position)
        end
    end

    def make_guess(guessed_position)
        debugger
      if @previous_pos == nil
        debugger
        @previous_pos = guessed_position
      else
        debugger
        if @board[@previous_pos].face_value == @board[guessed_position].face_value
            @board[@previous_pos].reveal
            @board[guessed_position].reveal
            debugger
        end
      end
      @previous_pos = nil
    end

end
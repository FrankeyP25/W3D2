require_relative "./board.rb"
require_relative "./human_player.rb"



class Game

    def initialize(board_length)
        @board = Board.new(board_length)
        @guessed_pos = HumanPlayer.new

    end

    def play
        while !@board.won?
            



        end



    end








end
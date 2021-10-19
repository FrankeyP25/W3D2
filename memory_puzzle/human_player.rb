


class HumanPlayer

    
    def get_positon
        puts "enter a position to reveal, ex: '1,2'"
        pos = gets.chomp.split(",").map(&:to_i)
        @board[pos]

    end



end
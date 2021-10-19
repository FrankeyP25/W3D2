require_relative "./card.rb"
class Board

    attr_reader :grid
    
    def initialize(board_length)
        raise "board_length has to be even" if !board_length.even?
        @size = board_length * board_length
        @grid = Array.new(board_length) {Array.new(board_length)}
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def []=(pos, card_inst)
        row, col = pos
        @grid[row][col] = card_inst
    end

    def populate
        pairs_needed = @size / 2
        alpha = ("a".."z").to_a
        added_pairs = []

        while  added_pairs.length <= pairs_needed
            random_char = alpha.sample

            if !added_pairs.include?(random_char)
                card_1 = Card.new(random_char)
                card_2 = Card.new(random_char)

                row_1, col_1 = rand(0..@grid.length - 1), rand(0..@grid.length - 1)
                row_2, col_2 = rand(0..@grid.length - 1), rand(0..@grid.length - 1)

                if !@grid[row_1][col_1] && !@grid[row_2][col_2]
                    @grid[row_1][col_1] = card_1
                    @grid[row_2][col_2] = card_2
                    added_pairs << random_char
                end
            end
        end
    end


    def render
        # @grid.each do |sub_arr|
        #     sub_arr.each do |card_inst|
        #         print card_inst.face_value + " "
        #     end
        #     puts " "
        # end
        (0..@grid[0].length-1).each do |i| 
            if i == 0
                print "  " + i.to_s
            else
                print " " + i.to_s
            end
        end
        puts
        @grid.map.with_index do |sub_arr, i|
            print i.to_s + " "
            sub_arr.map do |card_inst|  
                if card_inst.face_up?
                    print card_inst.face_value + " "
                else
                    print "  "
                end
            end
            puts
        end
    end

    def won?
        @grid.flatten.all? { |card_inst| card_inst.face_up? }
    end

    def reveal_all_cards
        @grid.map do |sub_arr|
            sub_arr.map { |card_inst| card_inst.reveal }
        end
    end

    




end
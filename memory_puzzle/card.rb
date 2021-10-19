


class Card

    attr_reader :face_value

    def initialize(face_value)
        @face_value = face_value
        @face_up = false
    end
 

    def face_up?
       @face_up 
    end

    #card_inst.hide
    def hide
        @face_up = false
    end

    def reveal
        @face_up = true
    end


    def to_s

    end


    def ==(second_card_inst)
        self.face_value == second_card_inst.face_value
    end


end
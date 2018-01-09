require_relative 'board.rb'
#require_relative 'player.rb'
class Pieces
  attr_accessor :starting_position

  def name
    @name
  end

  def character
    @character
  end

end
class Rook<Pieces
  @@rooks=0
  def initialize
    @@rooks+=1
    self.set_starting_location
  end

  def set_starting_location
    if @@rooks==1
      @starting_position=0
      @name="w_rook_l"
      @character=" wR"
    elsif @@rooks==2
      @starting_position=7
      @name="w_rook_r"
      @character=" wR"
    elsif @@rooks==3
      @starting_position=70
      @name="b_rook_l"
      @character=" bR"
    else
      @starting_position=77
      @name="b_rook_r"
      @character=" bR"
    end
  end
end

class Knight<Pieces
  @@knights=0
  def initialize
    @@knights+=1
    self.set_starting_location
  end
  def set_starting_location
    if @@knights==1
      @starting_position=01
      @name="w_knight_l"
      @character=" wK"
    elsif @@knights==2
      @starting_position=6
      @name="w_knight_r"
      @character=" wK"
    elsif @@knights==3
      @starting_position=71
      @name="b_knight_l"
      @character=" bK"
    else
      @starting_position=76
      @name="b_knight_r"
      @character=" bK"
    end
  end
end

class Bishop<Pieces
  @@bishops=0
  def initialize
    @@bishops+=1
    self.set_starting_location
  end

  def set_starting_location
    if @@bishops==1
      @starting_position=02
      @name="w_bishop_l"
      @character=" wB"
    elsif @@bishops==2
      @starting_position=5
      @name="w_bishop_r"
      @character=" wB"
    elsif @@bishops==3
      @starting_position=72
      @name="b_bishop_l"
      @character=" bB"
    else
      @starting_position=75
      @name="b_bishop_r"
      @character=" bB"
    end
  end
end

class Queen<Pieces
  @@queen=0

  def initialize
    @@queen+=1
    self.set_starting_location
  end

  def set_starting_location
    if @@queen==1
      @starting_position=03
      @name="w_queen"
      @character=" wQ"
    else
      @starting_position=73
      @name="b_queen"
      @character=" bQ"
    end
  end
end

class King<Pieces
  @@king=0
  def initialize
    @@king+=1
    self.set_starting_location
  end

  def set_starting_location
    if @@king==1
      @starting_position=04
      @name="w_king"
      @character=" wK"
    else
      @starting_position=74
      @name="b_king"
      @character=" bK"
    end
  end
end

class Pawn<Pieces
  @@pawn=0
  def initialize
    @@pawn+=1
    self.set_starting_location
  end
#uses pawn number to set location of white and black pawns
  def set_starting_location
    if (1..8).include?(@@pawn)
      @starting_position=@@pawn+9
      @name="w_Pawn"
      @character=" wP"
    elsif (9..16).include?(@@pawn)
        @starting_position=@@pawn+51
        @name="b_Pawn"
        @character=" bP"
    end
  end
end

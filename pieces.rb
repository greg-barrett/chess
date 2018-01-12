
class Pieces
  attr_accessor :current_location, :name, :first_location, :last_location, :en_passant
  @@square_numbers=[0, 1, 2, 3, 4, 5, 6, 7,
        10, 11, 12, 13, 14, 15, 16, 17,
        20, 21, 22, 23, 24, 25, 26, 27,
        30, 31, 32, 33, 34, 35, 36, 37,
        40, 41, 42, 43, 44, 45, 46, 47,
        50, 51, 52, 53, 54, 55, 56, 57,
        60, 61, 62, 63, 64, 65, 66, 67,
        70, 71, 72, 73, 74, 75, 76, 77]
  def character
    @character
  end
end

class Rook<Pieces
  attr_accessor :colour
  @@rooks=0
  def initialize
    @@rooks+=1
    self.set_starting_location

    @moves_ri=[1, 2, 3, 4, 5, 6, 7]
    @moves_le=[-1,-2,-3,-4,-5,-6,-7]
    @moves_up=[10, 20, 30, 40, 50, 60, 70]
    @moves_do=[-10, -20, -30, -40, -50, -60, -70]
  end

  def set_starting_location
    if @@rooks==1
      @current_location=0
      @name="Rook #{@current_location}"
      @character=" wR"

    elsif @@rooks==2
      @current_location=7
      @name="Rook #{@current_location}"
      @character=" wR"
    elsif @@rooks==3
      @current_location=70
      @name="Rook #{@current_location}"
      @character=" bR"
    else
      @current_location=77
      @name="Rook #{@current_location}"
      @character=" bR"
    end
  end

  def calculate_moves(board)
    start_position=self.current_location
    return unless (0..77).include?(start_position)
    @calculated_moves=[]
    @moves_ri.each do |m|
      landing=m+start_position
      break if !@@square_numbers.include?(landing)
      break if board[landing].include?(self.character[1])
      @calculated_moves<<landing
      break if board[landing]!="   "
      end
    @moves_le.each do |m|
      landing=m+start_position
      break if !@@square_numbers.include?(landing)
      break if board[landing].include?(self.character[1])
      @calculated_moves<<landing
      break if board[landing]!="   "
      end
    @moves_up.each do |m|
      landing=m+start_position
      break if !@@square_numbers.include?(landing)
      break if board[landing].include?(self.character[1])
      @calculated_moves<<landing
      break if board[landing]!="   "
      end
    @moves_do.each do |m|
      landing=m+start_position
      break if !@@square_numbers.include?(landing)
      break if board[landing].include?(self.character[1])
      @calculated_moves<<landing
      break if board[landing]!="   "
      end

  end

  def calculated_moves
    @calculated_moves
  end

end

class Knight<Pieces
  @@knights=0
  def initialize
    @@knights+=1
    self.set_starting_location

    @moves_up_ri=[21]
    @moves_ri_up=[12]
    @moves_ri_do=[-8]
    @moves_do_ri=[-19]
    @moves_do_le=[-21]
    @moves_le_do=[-12]
    @moves_le_up=[8]
    @moves_up_le=[19]

  end
  def set_starting_location
    if @@knights==1
      @current_location=01
      @name="Knight #{@current_location}"
      @character=" wN"
    elsif @@knights==2
      @current_location=6
      @name="Knight #{@current_location}"
      @character=" wN"
    elsif @@knights==3
      @current_location=71
      @name="Knight #{@current_location}"
      @character=" bN"
    else
      @current_location=76
      @name="Knight #{@current_location}"
      @character=" bN"
    end
  end

  def calculate_moves(board)
    start_position=self.current_location
    return unless (0..77).include?(start_position)
    @calculated_moves=[]
    @moves_up_ri.each do |m|
      landing=m+start_position
      break if !@@square_numbers.include?(landing)
      break if board[landing].include?(self.character[1])
      @calculated_moves<<landing
      end
    @moves_ri_up.each do |m|
      landing=m+start_position
      break if !@@square_numbers.include?(landing)
      break if board[landing].include?(self.character[1])
      @calculated_moves<<landing
      end
    @moves_ri_do.each do |m|
      landing=m+start_position
      break if !@@square_numbers.include?(landing)
      break if board[landing].include?(self.character[1])
      @calculated_moves<<landing
      end
    @moves_do_ri.each do |m|
      landing=m+start_position
      break if !@@square_numbers.include?(landing)
      break if board[landing].include?(self.character[1])
      @calculated_moves<<landing
      end
    @moves_do_le.each do |m|
      landing=m+start_position
      break if !@@square_numbers.include?(landing)
      break if board[landing].include?(self.character[1])
      @calculated_moves<<landing
      end
    @moves_le_do.each do |m|
      landing=m+start_position
      break if !@@square_numbers.include?(landing)
      break if board[landing].include?(self.character[1])
      @calculated_moves<<landing
      end
    @moves_le_up.each do |m|
      landing=m+start_position
      break if !@@square_numbers.include?(landing)
      break if board[landing].include?(self.character[1])
      @calculated_moves<<landing
      end
    @moves_up_le.each do |m|
      landing=m+start_position
      break if !@@square_numbers.include?(landing)
      break if board[landing].include?(self.character[1])
      @calculated_moves<<landing
      end
  end

  def calculated_moves
    @calculated_moves
  end

end

class Bishop<Pieces
  @@bishops=0
  def initialize
    @@bishops+=1
    self.set_starting_location

    @moves_di_up_ri=[11,22,33,44,55,66,77]
    @moves_di_up_le=[9, 18, 27, 36, 45, 54, 63]
    @moves_di_do_ri=[-9, -18, -27, -36, -45, -54, -63]
    @moves_di_do_le=[-11,-22,-33,-44,-55,-66,-77]
  end

  def set_starting_location
    if @@bishops==1
      @current_location=02
      @name="Bishop #{@current_location}"
      @character=" wB"
    elsif @@bishops==2
      @current_location=5
      @name="Bishop #{@current_location}"
      @character=" wB"
    elsif @@bishops==3
      @current_location=72
      @name="Bishop #{@current_location}"
      @character=" bB"
    else
      @current_location=75
      @name="Bishop #{@current_location}"
      @character=" bB"
    end
  end

  def calculate_moves(board)
    start_position=self.current_location
    return unless (0..77).include?(start_position)
    @calculated_moves=[]
    @moves_di_up_ri.each do |m|
      landing=m+start_position
      break if !@@square_numbers.include?(landing)
      break if board[landing].include?(self.character[1])
      @calculated_moves<<landing
      break if board[landing]!="   "
      end
    @moves_di_up_le.each do |m|
      landing=m+start_position
      break if !@@square_numbers.include?(landing)
      break if board[landing].include?(self.character[1])
      @calculated_moves<<landing
      break if board[landing]!="   "
      end
    @moves_di_do_ri.each do |m|
      landing=m+start_position
      break if !@@square_numbers.include?(landing)
      break if board[landing].include?(self.character[1])
      @calculated_moves<<landing
      break if board[landing]!="   "
      end
    @moves_di_do_le.each do |m|
      landing=m+start_position
      break if !@@square_numbers.include?(landing)
      break if board[landing].include?(self.character[1])
      @calculated_moves<<landing
      break if board[landing]!="   "
      end
  end

  def calculated_moves
    @calculated_moves
  end
end

class Queen<Pieces
  @@queens=0

  def initialize
    @@queens+=1
    self.set_starting_location

    @moves_ri=[1, 2, 3, 4, 5, 6, 7]
    @moves_le=[-1,-2,-3,-4,-5,-6,-7]
    @moves_up=[10, 20, 30, 40, 50, 60, 70]
    @moves_do=[-10, -20, -30, -40, -50, -60, -70]
    @moves_di_up_ri=[11,22,33,44,55,66,77]
    @moves_di_up_le=[9, 18, 27, 36, 45, 54, 63]
    @moves_di_do_ri=[-9, -18, -27, -36, -45, -54, -63]
    @moves_di_do_le=[-11,-22,-33,-44,-55,-66,-77]
  end

  def set_starting_location
    if @@queens==1
      @current_location=03
      @name="Queen #{@current_location}"
      @character=" wQ"
    else
      @current_location=73
      @name="Queen #{@current_location}"
      @character=" bQ"
    end
  end

  def calculate_moves(board)
    start_position=self.current_location
    return unless (0..77).include?(start_position)
    @calculated_moves=[]
    @moves_ri.each do |m|
      landing=m+start_position
      break if !@@square_numbers.include?(landing)
      break if board[landing].include?(self.character[1])
      @calculated_moves<<landing
      break if board[landing]!="   "
      end
    @moves_le.each do |m|
      landing=m+start_position
      break if !@@square_numbers.include?(landing)
      break if board[landing].include?(self.character[1])
      @calculated_moves<<landing
      break if board[landing]!="   "
      end
    @moves_up.each do |m|
      landing=m+start_position
      break if !@@square_numbers.include?(landing)
      break if board[landing].include?(self.character[1])
      @calculated_moves<<landing
      break if board[landing]!="   "
      end
    @moves_do.each do |m|
      landing=m+start_position
      break if !@@square_numbers.include?(landing)
      break if board[landing].include?(self.character[1])
      @calculated_moves<<landing
      break if board[landing]!="   "
      end
    @moves_di_up_ri.each do |m|
      landing=m+start_position
      break if !@@square_numbers.include?(landing)
      break if board[landing].include?(self.character[1])
      @calculated_moves<<landing
      break if board[landing]!="   "
      end
    @moves_di_up_le.each do |m|
      landing=m+start_position
      break if !@@square_numbers.include?(landing)
      break if board[landing].include?(self.character[1])
      @calculated_moves<<landing
      break if board[landing]!="   "
      end
    @moves_di_do_ri.each do |m|
      landing=m+start_position
      break if !@@square_numbers.include?(landing)
      break if board[landing].include?(self.character[1])
      @calculated_moves<<landing
      break if board[landing]!="   "
      end
    @moves_di_do_le.each do |m|
      landing=m+start_position
      break if !@@square_numbers.include?(landing)
      break if board[landing].include?(self.character[1])
      @calculated_moves<<landing
      break if board[landing]!="   "
      end
  end

  def calculated_moves
    @calculated_moves
  end

end

class King<Pieces
  @@kings=0
  def initialize
    @@kings+=1
    self.set_starting_location

    @moves_ri=[1]
    @moves_le=[-1]
    @moves_up=[10]
    @moves_do=[-10]
    @moves_di_up_ri=[11]
    @moves_di_up_le=[9]
    @moves_di_do_ri=[-9]
    @moves_di_do_le=[-11]
  end

  def set_starting_location
    if @@kings==1
      @current_location=04
      @name="King #{@current_location}"
      @character=" wK"
    else
      @current_location=74
      @name="King #{@current_location}"
      @character=" bK"
    end
  end

  def calculate_moves(board)
    start_position=self.current_location
    return unless (0..77).include?(start_position)
    @calculated_moves=[]
    @moves_ri.each do |m|
      landing=m+start_position
      break if !@@square_numbers.include?(landing)
      break if board[landing].include?(self.character[1])
      @calculated_moves<<landing
      end
    @moves_le.each do |m|
      landing=m+start_position
      break if !@@square_numbers.include?(landing)
      break if board[landing].include?(self.character[1])
      @calculated_moves<<landing
      end
    @moves_up.each do |m|
      landing=m+start_position
      break if !@@square_numbers.include?(landing)
      break if board[landing].include?(self.character[1])
      @calculated_moves<<landing
      end
    @moves_do.each do |m|
      landing=m+start_position
      break if !@@square_numbers.include?(landing)
      break if board[landing].include?(self.character[1])
      @calculated_moves<<landing
      end
    @moves_di_up_ri.each do |m|
      landing=m+start_position
      break if !@@square_numbers.include?(landing)
      break if board[landing].include?(self.character[1])
      @calculated_moves<<landing
      end
    @moves_di_up_le.each do |m|
      landing=m+start_position
      break if !@@square_numbers.include?(landing)
      break if board[landing].include?(self.character[1])
      @calculated_moves<<landing
      end
    @moves_di_do_ri.each do |m|
      landing=m+start_position
      break if !@@square_numbers.include?(landing)
      break if board[landing].include?(self.character[1])
      @calculated_moves<<landing
      end
    @moves_di_do_le.each do |m|
      landing=m+start_position
      break if !@@square_numbers.include?(landing)
      break if board[landing].include?(self.character[1])
      @calculated_moves<<landing
      end
  end

  def calculated_moves
    @calculated_moves
  end
end

class Pawn<Pieces
  attr_accessor :colour, :en_passant
  @@pawns=0
  def initialize
    @@pawns+=1
    self.set_starting_location
    @en_passant=[]


    @moves_up=[10]
    @first_move_up=[20]
    @moves_do=[-10]
    @first_move_down=[-20]
    @moves_di_up_ri=[11]
    @moves_di_up_le=[9]
    @moves_di_do_ri=[-9]
    @moves_di_do_le=[-11]
  end
  def set_starting_location
    if (1..8).include?(@@pawns)
      @current_location=@@pawns+9
      @first_location=@@pawns+9

      @name="Pawn #{@current_location}"
      @character=" wP"
      @colour="White"
    elsif (9..16).include?(@@pawns)
        @current_location=@@pawns+51
        @first_location=@@pawns+51

        @name="Pawn #{@current_location}"
        @character=" bP"
        @colour="Black"
    end
  end

  def calculate_moves(board)
    start_position=self.current_location
    return unless (0..77).include?(start_position)
    @calculated_moves=[]

    if self.colour =="White"
      if @first_location==@current_location
        @first_move_up.each do |m|
          landing=m+start_position
          break if !@@square_numbers.include?(landing)
          break if board[landing]!="   "
          break if board[landing-10]!="   "
          break if board[landing].include?("w")
          @calculated_moves<<landing
        end
      end
      if
        @moves_up.each do |m|
          landing=m+start_position
          break if !@@square_numbers.include?(landing)
          break if board[landing]!="   "
          break if board[landing].include?("w")
          @calculated_moves<<landing
        end
        @moves_di_up_ri.each do |m|
          landing=m+start_position
          break if !@@square_numbers.include?(landing)
          break if board[landing]=="   "
          break if board[landing].include?("w")
          @calculated_moves<<landing
        end
        @moves_di_up_le.each do |m|
          landing=m+start_position
          break if !@@square_numbers.include?(landing)
          break if board[landing]=="   "
          break if board[landing].include?("w")
          @calculated_moves<<landing
        end
      end
      else#if piece is black
        if @first_location==@current_location
          @first_move_down.each do |m|
            landing=m+start_position
            break if !@@square_numbers.include?(landing)
            break if board[landing]!="   "
            break if board[landing-10]!="   "
            break if board[landing].include?("b")
            @calculated_moves<<landing
          end
        end
        if
          @moves_do.each do |m|
            landing=m+start_position
            break if !@@square_numbers.include?(landing)
            break if board[landing]!="   "
            break if board[landing].include?("b")
            @calculated_moves<<landing
          end
          @moves_di_do_ri.each do |m|
            landing=m+start_position
            break if !@@square_numbers.include?(landing)
            break if board[landing]=="   "
            break if board[landing].include?("b")
            @calculated_moves<<landing
          end
          @moves_di_do_le.each do |m|
            landing=m+start_position
            break if !@@square_numbers.include?(landing)
            break if board[landing]=="   "
            break if board[landing].include?("b")
            @calculated_moves<<landing
          end
        end
      end

    end

  def calculated_moves
    @calculated_moves
  end

  def en_passant?(board, all_pieces, last_played_piece)
    position=self.current_location
    if self.colour=="Black"
      if board[position-9]=="   " && board[position+1]==" wP"
        all_pieces.each do |loser|
          if loser.current_location==position+1
            if loser.last_location==loser.current_location-20
              if last_played_piece==loser
                @en_passant<<position-9
              end
            end
          end
        end
      end
      if board[position-11]=="   " && board[position-1]==" wP"
        all_pieces.each do |loser|
          if loser.current_location==position-1
            if loser.last_location==loser.current_location-20
              if last_played_piece==loser
                @en_passant<<position-11
              end
            end
          end
        end
      end
    else #if self.colour=="White"
      if board[position+11]=="   " && board[position+1]==" bP"
        all_pieces.each do |loser|
          if loser.current_location==position+1
            if loser.last_location==loser.current_location+20
              if last_played_piece==loser
                @en_passant<<position+11
              end
            end
          end
        end
      end
      if board[position+9]=="   " && board[position-1]==" bP"
        all_pieces.each do |loser|
          if loser.current_location==position-1
            if loser.last_location==loser.current_location+20
              if last_played_piece==loser
                @en_passant<<position+9
              end
            end
          end
        end
      end
    end
  end


end

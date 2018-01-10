
class Pieces
  attr_accessor :current_location, :name
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
end

class Knight<Pieces
  @@knights=0
  def initialize
    @@knights+=1
    self.set_starting_location
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
end

class Bishop<Pieces
  @@bishops=0
  def initialize
    @@bishops+=1
    self.set_starting_location
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
      break if !(0..77).include?(landing)
      @calculated_moves<<landing
      break if board[landing]!="   "
      end
    @moves_le.each do |m|
      landing=m+start_position
      break if !(0..77).include?(landing)
      @calculated_moves<<landing
      break if board[landing]!="   "
      end
    @moves_up.each do |m|
      landing=m+start_position
      break if !(0..77).include?(landing)
      @calculated_moves<<landing
      break if board[landing]!="   "
      end
    @moves_do.each do |m|
      landing=m+start_position
      break if !(0..77).include?(landing)
      @calculated_moves<<landing
      break if board[landing]!="   "
      end
    @moves_di_up_ri.each do |m|
      landing=m+start_position
      break if !(0..77).include?(landing)
      @calculated_moves<<landing
      break if board[landing]!="   "
      end
    @moves_di_up_le.each do |m|
      landing=m+start_position
      break if !(0..77).include?(landing)
      @calculated_moves<<landing
      break if board[landing]!="   "
      end
    @moves_di_do_ri.each do |m|
      landing=m+start_position
      break if !(0..77).include?(landing)
      @calculated_moves<<landing
      break if board[landing]!="   "
      end
    @moves_di_do_le.each do |m|
      landing=m+start_position
      break if !(0..77).include?(landing)
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
end

class Pawn<Pieces
  @@pawns=0
  def initialize
    @@pawns+=1
    self.set_starting_location
    @plays=1


    @moves_up=[10, 20]
    @moves_do=[-10, -20]
    @moves_di_up_ri=[11]
    @moves_di_up_le=[9]
    @moves_di_do_ri=[-9]
    @moves_di_do_le=[-11]
  end
  def set_starting_location
    if (1..8).include?(@@pawns)
      @current_location=@@pawns+9
      @name="Pawn #{@current_location}"
      @character=" wP"
    elsif (9..16).include?(@@pawns)
        @current_location=@@pawns+51
        @name="Pawn #{@current_location}"
        @character=" bP"
    end
  end

  def calculate_moves(board)
    start_position=self.current_location
    return unless (0..77).include?(start_position)
    @calculated_moves=[]
  #I am here trying to figue out what moves  a pwan can make
    @moves_up.each do |m|
      landing=m+start_position
      break if !(0..77).include?(landing)
      @calculated_moves<<landing
      break if board[landing]!="   "
      end
    @moves_do.each do |m|
      landing=m+start_position
      break if !(0..77).include?(landing)
      @calculated_moves<<landing
      break if board[landing]!="   "
      end
    @moves_di_up_ri.each do |m|
      landing=m+start_position
      break if !(0..77).include?(landing)
      @calculated_moves<<landing
      break if board[landing]!="   "
      end
    @moves_di_up_le.each do |m|
      landing=m+start_position
      break if !(0..77).include?(landing)
      @calculated_moves<<landing
      break if board[landing]!="   "
      end
    @moves_di_do_ri.each do |m|
      landing=m+start_position
      break if !(0..77).include?(landing)
      @calculated_moves<<landing
      break if board[landing]!="   "
      end
    @moves_di_do_le.each do |m|
      landing=m+start_position
      break if !(0..77).include?(landing)
      @calculated_moves<<landing
      break if board[landing]!="   "
      end
  end

  def calculated_moves
    @calculated_moves
  end
end

class Player
  attr_accessor :name, :queen
  @@players=0
  @@all_pieces=[]
#creating a new player also triggers the making of the pieces
  def initialize(name)
    @name=name
    @@players+=1
    @pieces=[]
    self.make_pieces
  end
#creates the pieces for the board
  def make_pieces
    @pieces<<@rook_l=Rook.new
    @pieces<<@knight_l=Knight.new
    @pieces<<@bishop_l=Bishop.new
    @pieces<<@queen=Queen.new
    @pieces<<@king=King.new
    @pieces<<@bishop_r=Bishop.new
    @pieces<<@knight_r=Knight.new
    @pieces<<@rook_r=Rook.new
    8.times {@pieces<<@pawn=Pawn.new}
    @pieces.each do |x|
      @@all_pieces<<x
    end
  end

  def Player.all_pieces
    @@all_pieces
  end

end

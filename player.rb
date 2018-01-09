require_relative 'board.rb'
require_relative 'pieces.rb'
class Player
  attr_accessor :name, :colour
  @@players=0
#creating a new player also triggers the making of the pieces
  def initialize(name)
    @name=name
    @@players+=1
    self.set_colour
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
  end
#show pices
  def pieces
    @pieces.each do |x|
    puts  x.name
    puts  x.starting_position
    puts  x.character
    end
  end

#sets player colour
  def set_colour
    if @@players==1
      @colour="White"
    else
      @colour="Black"
    end
  end

end

a=Player.new("Greg")
b=Player.new("Adam")
puts a.name
a.pieces

puts b.name
b.pieces

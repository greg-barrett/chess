require_relative 'board.rb'
require_relative 'pieces.rb'
require_relative 'player.rb'
=begin
#male player and pieces
a=Player.new("Greg")
b=Player.new("Adam")
puts a.name
puts b.name
puts ""
#make board class, make acutal board, show board
board=Board.new
board.create_board
board.update_board(Player.all_pieces)
board.show_board
a.move_piece("Pawn 10", 20)
board.update_board(Player.all_pieces)
board.show_board
puts ""
=end
class Game
  attr_accessor :white, :black, :board, :caught
  def initialize
    @white=Player.new("Greg")
    @black=Player.new("Adam")
    puts @white.name
    puts @black.name
    puts ""
    #make board class, make acutal board, show board
    @board=Board.new
    @caught=[]
  end
#takes user input and formats it, then calls the move method
  def configure_input(move)
    move=move.split(" to ")
    @piece=move[0].capitalize
    @new_location=move[1].to_i
    self.move_piece(@piece, @new_location)
  end
#move method called by emthod above to change location of piece
#first collects all pieces from @@pieces, then when it finds the name of the piece
#and that the move the player wants to do is legal it goes on to the second if
#second if checks if there is already something in the new location
#if yes we iterate through @@pieces again to find the piece with
#the same character. When found
#then we change location to "caught and remove location from the name of the caught piece"
#then we add the piece to the caught array and delete it from @@pieces
#then we change the location of the piece in play
#then we change the name of the piece to its new name(with square number)
#done!
  def move_piece(piece_name, new_location)
    Player.all_pieces.each do |x|
      if x.name == piece_name && x.calculated_moves.include?(new_location)
        if @board.board[new_location.to_i]!="   "
          Player.all_pieces.each do |v|
            if v.character==@board.board[new_location.to_i]
              v.current_location="caught"
              v.name=v.name[0..-3]
              @caught<< v
              Player.all_pieces.delete(v)
            end
          end
        end
        old_location =x.current_location
        x.current_location=new_location
        x.name=x.name.gsub!(/\d+/, new_location.to_s)
        puts x.name
      else
        puts "invlaid move"
      end
    end
  end

end

game=Game.new

game.board.show_board
#game.move_piece("Pawn 10", 20)
game.board.update_board(Player.all_pieces)
game.board.show_board
#game.configure_input(move=gets.chomp)
#game.board.update_board(Player.all_pieces)
#game.board.show_board
game.black.queen.calculate_moves(game.board.board)
puts game.black.queen.calculated_moves
game.move_piece("Queen 73", 74)
game.board.update_board(Player.all_pieces)
game.board.show_board

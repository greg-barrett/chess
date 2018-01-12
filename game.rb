require_relative 'board.rb'
require_relative 'pieces.rb'
require_relative 'player.rb'
class Game
  attr_accessor :white, :black, :turns, :board, :caught, :piece_in_play, :last_played_piece
  def initialize
    @white=Player.new("Greg")
    @black=Player.new("Adam")
    @turns=0
    #make board class, make acutal board, show board
    @board=Board.new
    @caught=[]
    @last_played_piece=nil
  end
#each time called changes player to oposite by increasing turns
  def current_player
    if @turns%2==0
      @white
    else
      @black
    end
  end
#takes user input and formats it, then calls the move method
  def configure_input(move)
    move=move.split(" to ")
    @piece=move[0].capitalize
    @new_location=move[1].to_i
    #self.move_piece(@piece, @new_location)
  end

  def move_piece(piece_instance, new_location)
    if piece_instance.calculated_moves.include?(new_location)
      if @board.board[new_location]!="   "
        Player.all_pieces.each do |v|
          if v.character==@board.board[new_location.to_i] && v.name.include?(new_location.to_s)
            v.current_location="caught"
            v.name=v.name[0..-3]
            @caught<< v
            Player.all_pieces.delete(v)
          end
        end
      end
      piece_instance.last_location=piece_instance.current_location
      piece_instance.current_location=new_location
      piece_instance.name=piece_instance.name.gsub!(/\d+/, new_location.to_s)
      @turns+=1
      @ok=true
      @last_played_piece=piece_instance
  elsif piece_instance.en_passant.include?(new_location)
    Player.all_pieces.each do |v|
      if v.current_location== piece_instance.current_location+1
        v.current_location="caught"
        v.name=v.name[0..-3]
        @caught<< v
        Player.all_pieces.delete(v)
      end
    end
    piece_instance.last_location=piece_instance.current_location
    piece_instance.current_location=new_location
    piece_instance.name=piece_instance.name.gsub!(/\d+/, new_location.to_s)
    @turns+=1
    @ok=true
    @last_played_piece=piece_instance
  else
    puts "Illegal move"
    @ok=false
    end
  end

  def set_piece_in_play(piece_name)
    if current_player==@white
      @white.pieces.each do |instance|
        if instance.name==piece_name
          @piece_in_play=instance
        end
      end
    else
      if current_player==@black
      @black.pieces.each do |instance|
        if instance.name==piece_name
          @piece_in_play=instance
        end
      end
    end
  end
end

  def play
    input=""
    until input=="quit"
    #puts "hi"
    self.board.show_board
    puts "#{self.current_player.name} plaese take your turn"
    #puts "eg Pawn 10 to 30"
    input=gets.chomp!

    break if input =="quit"
    self.configure_input(input)
    self.set_piece_in_play(@piece)
    self.piece_in_play.calculate_moves(self.board.board)
    puts self.piece_in_play.calculated_moves
    self.piece_in_play.en_passant?(self.board.board, Player.all_pieces, self.last_played_piece)

    self.move_piece(@piece_in_play, @new_location)
    redo if @ok==false
    self.board.update_board(Player.all_pieces)
    self.board.show_board
    end
  end
end

game=Game.new
game.play

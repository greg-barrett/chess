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
    @won=false
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
  end

  def promotion?(pawn)
    if pawn.name.include?("Pawn")
      (0..7).each do |x|
        if pawn.current_location==x
          return true
        end
      end
      (70..77).each do |x|
        if pawn.current_location==x
          return true
        end
      end
    else
      false
    end
  end

  def promote(pawn)
    puts "#{self.current_player.name} please promote your Pawn to a piece of your choosing."
    @new_piece=gets.chomp
    @new_piece=Kernel.const_get(@new_piece).new
    puts @new_piece.current_location=pawn.current_location
    puts @new_piece.name=@new_piece.name.gsub!(/\d+/, pawn.current_location.to_s)
    puts @new_piece.character=" "<<pawn.character[1]<<@new_piece.name[0]
    puts @new_piece.last_location="New"
    Player.all_pieces<<@new_piece
    self.current_player.pieces<<@new_piece
    Player.all_pieces.delete(pawn)
    self.current_player.pieces.delete(pawn)
  end

  def update_piece_attributes(piece_instance, new_location)
      piece_instance.last_location=piece_instance.current_location
      piece_instance.current_location=new_location
      piece_instance.name=piece_instance.name.gsub!(/\d+/, new_location.to_s)
      self.last_played_piece=piece_instance
    end

  def update_game_attributes(piece_instance)
       @turns+=1
       @ok=true
       @last_played_piece=piece_instance

      #update_castling_stats
      puts piece_instance.moved+=1 if piece_instance.name.include?("King") || piece_instance.name.include?("Rook")
    end

  def update_occupied_square(new_location)
      Player.all_pieces.each do |v|
        if v.character==@board.board[new_location.to_i] && v.name.include?(new_location.to_s)
           v.current_location="caught"
           v.name=v.name[0..-3]
           @caught<< v
           Player.all_pieces.delete(v)
         end
       end
    end

  def enpassant_capture(new_location)
      Player.all_pieces.each do |v|
        if v.current_location== new_location+10 ||  v.current_location== new_location-10
          v.current_location="caught"
          v.name=v.name[0..-3]
          @caught<< v
          Player.all_pieces.delete(v)
        end
      end
    end

  def update_rook_during_castling(new_location, piece_instance)
      if new_location > piece_instance.current_location && piece_instance.character.include?("w")
        rook=7
        rook_new_location=5
      elsif new_location < piece_instance.current_location && piece_instance.character.include?("w")
        rook=0
        rook_new_location=3
      elsif new_location > piece_instance.current_location && piece_instance.character.include?("b")
        rook=77
        rook_new_location=75
      elsif new_location < piece_instance.current_location && piece_instance.character.include?("b")
        rook=70
        rook_new_location=73
      end

      Player.all_pieces.each do |piece|
        if piece.current_location==rook
          piece.last_location=piece.current_location
          piece.current_location=rook_new_location
          piece.name=piece.name.gsub!(/\d+/, 73.to_s)
          piece.moved+=1
        end
      end
    end

  def move_piece(piece_instance, new_location)
    #play a standard move with or without capturing a piece
    if piece_instance.calculated_moves.include?(new_location)
      self.update_occupied_square(new_location) if @board.board[new_location]!="   "
      self.update_piece_attributes(piece_instance, new_location)
      self.promote(piece_instance) if self.promotion?(piece_instance)==true
      self.update_game_attributes(piece_instance)
    #play the enpassant move
    elsif piece_instance.name.include?("Pawn") && piece_instance.en_passant.include?(new_location)
      self.enpassant_capture(new_location)
      self.update_piece_attributes(piece_instance, new_location)
      self.update_game_attributes(piece_instance)
    #play the castleing move
    elsif piece_instance.name.include?("King") && piece_instance.castle.include?(new_location)
      self.update_rook_during_castling(new_location, piece_instance)
      self.update_piece_attributes(piece_instance, new_location)
      self.update_game_attributes(piece_instance)
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
    else# current_player==@black
      @black.pieces.each do |instance|
        if instance.name==piece_name
          @piece_in_play=instance
        end
      end
    end
  end

  def play
    input=""
    until self.won?(self.current_player)
      self.current_player.king.check?(Player.all_pieces, self.current_player, self.board.board)
      puts "#{self.current_player.name} you are in check" if self.current_player.king.in_check==true

      self.current_player.king.checkmate(Player.all_pieces, self.current_player, self.board.board)
      self.board.show_board
      break if self.won?(self.current_player)
      puts "#{self.current_player.name} plaese take your turn"
      puts "eg Pawn 10 to 30"
      input=gets.chomp!
      break if input =="quit"
      self.configure_input(input)
      self.set_piece_in_play(@piece)
      redo if self.piece_in_play== @last_played_piece
      self.piece_in_play.calculate_moves(self.board.board)
      self.piece_in_play.en_passant?(self.board.board, Player.all_pieces, self.last_played_piece) if self.piece_in_play.name.include?("Pawn")

      self.piece_in_play.castling?(self.board.board, Player.all_pieces, @new_location) if self.piece_in_play.name.include?("King")
      self.move_piece(@piece_in_play, @new_location)
      redo if @ok==false
      self.board.update_board(Player.all_pieces)
    end
  end

  def won?(current_player)
    if current_player.king.in_checkmate==true || current_player.king.current_location=="caught"
      @turns+=1
      puts "Congratulations #{self.current_player.name} has one!"

      @won=true
    else
      @won=false
    end
    return @won
  end
end

game=Game.new
game.play

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
      
      if self.promotion?(self.board.board)==true
        self.promote(piece_instance)
      end

      @turns+=1
      @ok=true
      @last_played_piece=piece_instance
      #castling
      if piece_instance.name.include?("King")
         piece_instance.moved+=1
      end
      if piece_instance.name.include?("Rook")
        piece_instance.moved+=1
      end
  elsif piece_instance.name.include?("Pawn") && piece_instance.en_passant.include?(new_location)
    Player.all_pieces.each do |v|
      if v.current_location== new_location+10 ||  v.current_location== new_location-10
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

  elsif piece_instance.name.include?("King") && piece_instance.castle.include?(new_location)
    if new_location > piece_instance.current_location && piece_instance.character.include?("w")
      Player.all_pieces.each do |piece|
        if piece.current_location==7
          piece.last_location=piece.current_location
          piece.current_location=5
          piece.name=piece.name.gsub!(/\d+/, 5.to_s)
          piece.moved+=1
        end
      end
      piece_instance.last_location=piece_instance.current_location
      piece_instance.current_location=new_location
      piece_instance.name=piece_instance.name.gsub!(/\d+/, new_location.to_s)
      @turns+=1
      @ok=true
      @last_played_piece=piece_instance
      piece_instance.moved+=1
    elsif new_location < piece_instance.current_location && piece_instance.character.include?("w")
      Player.all_pieces.each do |piece|
        if piece.current_location==0
          piece.last_location=piece.current_location
          piece.current_location=3
          piece.name=piece.name.gsub!(/\d+/, 3.to_s)
          piece.moved+=1
        end
      end
      piece_instance.last_location=piece_instance.current_location
      piece_instance.current_location=new_location
      piece_instance.name=piece_instance.name.gsub!(/\d+/, new_location.to_s)
      @turns+=1
      @ok=true
      @last_played_piece=piece_instance
      piece_instance.moved+=1
    elsif new_location > piece_instance.current_location && piece_instance.character.include?("b")
        Player.all_pieces.each do |piece|
          if piece.current_location==77
            piece.last_location=piece.current_location
            piece.current_location=75
            piece.name=piece.name.gsub!(/\d+/, 75.to_s)
            piece.moved+=1
          end
        end
        piece_instance.last_location=piece_instance.current_location
        piece_instance.current_location=new_location
        piece_instance.name=piece_instance.name.gsub!(/\d+/, new_location.to_s)
        @turns+=1
        @ok=true
        @last_played_piece=piece_instance
        piece_instance.moved+=1
      elsif new_location < piece_instance.current_location && piece_instance.character.include?("b")
        Player.all_pieces.each do |piece|
          if piece.current_location==70
            piece.last_location=piece.current_location
            piece.current_location=73
            piece.name=piece.name.gsub!(/\d+/, 73.to_s)
            piece.moved+=1
          end
        end
        piece_instance.last_location=piece_instance.current_location
        piece_instance.current_location=new_location
        piece_instance.name=piece_instance.name.gsub!(/\d+/, new_location.to_s)
        @turns+=1
        @ok=true
        @last_played_piece=piece_instance
        piece_instance.moved+=1
      end

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
    redo if self.piece_in_play== @last_played_piece
    self.piece_in_play.calculate_moves(self.board.board)
    #puts self.piece_in_play.calculated_moves
    if self.piece_in_play.name.include?("Pawn")
      self.piece_in_play.en_passant?(self.board.board, Player.all_pieces, self.last_played_piece)
      puts self.piece_in_play.en_passant
    end
    if self.piece_in_play.name.include?("King")
       self.piece_in_play.castling?(self.board.board, Player.all_pieces, @new_location)
       puts self.piece_in_play.castle
    end
    self.move_piece(@piece_in_play, @new_location)
    redo if @ok==false
    self.board.update_board(Player.all_pieces)
    self.board.show_board
    end
  end

  def promotion?(board)
    (0..7).each do |c|
      return true if board[c].include? "p"
    end
    (70..77).each do |c|
      return true if board[c].include? "p"
    end
    false
  end

  def promote(pawn)
    puts "#{self.current_player.name} please promote your Pawn to a piece of your choosing."
    @new_piece=gets.chomp
    @new_piece=Kernel.const_get(@new_piece).new
    puts @new_piece.current_location=pawn.current_location
    puts @new_piece.name=@new_piece<<" #{pawn.current_location}"
    puts @new_piece.last_location="New"
    Player.all_pieces<<@new_piece
    self.current_player.pieces<<@new_piece
    Player.all_pieces.delete(pawn)
    self.current_player.pieces.delete(pawn)
  end
end

game=Game.new
game.play

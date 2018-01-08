require_relative 'board.rb'

class Queen<Board
  @@quantity=0
  def initialize(board)
    @@quantity+=1
    #@board=board
    @moves_ri=[1, 2, 3, 4, 5, 6, 7]
    @moves_le=[-1,-2,-3,-4,-5,-6,-7]
    @moves_up=[10, 20, 30, 40, 50, 60, 70]
    @moves_do=[-10, -20, -30, -40, -50, -60, -70]
    @moves_di_up_ri=[11,22,33,44,55,66,77]
    @moves_di_up_le=[9, 18, 27, 36, 45, 54, 63]
    @moves_di_do_ri=[-9, -18, -27, -36, -45, -54, -63]
    @moves_di_do_le=[-11,-22,-33,-44,-55,-66,-77]
    self.set_start_position(board)
  end

  def set_start_position(board)
    if @@quantity==1
      @position=03
      @piece_symbol=" Qb"
    else
      @position=73
      @piece_symbol=" Qw"
    end
    board[@position]=@piece_symbol
  end
#below makes an array of all the places a queen can go
# from her current square-ignoring other pieces
#quits is start location is not on  board
  def calculate_moves(start_position, squares, board)
    return unless (0..77).include?(start_position)
    @calculated_moves=[]
    @moves_ri.each do |m|
      landing=m+start_position
      break if !squares.include?(landing)
      @calculated_moves<<landing
      break if board[landing]!="   "
      end
    @moves_le.each do |m|
      landing=m+start_position
      break if !squares.include?(landing)
      @calculated_moves<<landing
      break if board[landing]!="   "
      end
    @moves_up.each do |m|
      landing=m+start_position
      break if !squares.include?(landing)
      @calculated_moves<<landing
      break if board[landing]!="   "
      end
    @moves_do.each do |m|
      landing=m+start_position
      break if !squares.include?(landing)
      @calculated_moves<<landing
      break if board[landing]!="   "
      end
    @moves_di_up_ri.each do |m|
      landing=m+start_position
      break if !squares.include?(landing)
      @calculated_moves<<landing
      break if board[landing]!="   "
      end
    @moves_di_up_le.each do |m|
      landing=m+start_position
      break if !squares.include?(landing)
      @calculated_moves<<landing
      break if board[landing]!="   "
      end
    @moves_di_do_ri.each do |m|
      landing=m+start_position
      break if !squares.include?(landing)
      @calculated_moves<<landing
      break if board[landing]!="   "
      end
    @moves_di_do_le.each do |m|
      landing=m+start_position
      break if !squares.include?(landing)
      @calculated_moves<<landing
      break if board[landing]!="   "
      end
  end

  def calculated_moves
    @calculated_moves
  end

  def position
    @position
  end

  def make_move(move, board)
    if @calculated_moves.include?(move)
      board[@position]="   "
      @position=move
      board[@position]=@piece_symbol
    else
      puts "illegal move"
    end
  end

#test method to show where the queen can go
  def map_moves(board)
    @calculated_moves.each do |x|
      board[x]=" Q "
    end
  end

end
#set up board
board=Board.new
board.create_board
#set first queen positions
queen=Queen.new(board.board)

#display state of board
board.show_board

queen.calculate_moves(queen.position, board.square_numbers, board.board)

queen.make_move(25, board.board)
board.show_board

queen.calculate_moves(queen.position, board.square_numbers, board.board)
queen.make_move(35, board.board)
board.show_board

require_relative 'board.rb'

class Queen
  def initialize
    @moves_ri=[1, 2, 3, 4, 5, 6, 7]
    @moves_le=[-1,-2,-3,-4,-5,-6,-7]
    @moves_up=[10, 20, 30, 40, 50, 60, 70]
    @moves_do=[-10, -20, -30, -40, -50, -60, -70]
    @moves_di_up_ri=[11,22,33,44,55,66,77]
    @moves_di_up_le=[9, 18, 27, 36, 45, 54, 63]
    @moves_di_do_ri=[-9, -18, -27, -36, -45, -54, -63]
    @moves_di_do_le=[-11,-22,-33,-44,-55,-66,-77]
  end
#below makes an array of all the places a queen can go
# from her current square-ignoring other pieces
#quits is start location is not on  board
  def calculate_moves(start, squares, hash)
    return unless (0..77).include?(start)
    @calculated_moves=[]
    @moves_ri.each do |m|
      landing=m+start
      break if !squares.include?(landing)
      @calculated_moves<<landing
      break if hash[landing]!="   "
      end
    @moves_le.each do |m|
      landing=m+start
      break if !squares.include?(landing)
      @calculated_moves<<landing
      break if hash[landing]!="   "
      end
    @moves_up.each do |m|
      landing=m+start
      break if !squares.include?(landing)
      @calculated_moves<<landing
      break if hash[landing]!="   "
      end
    @moves_do.each do |m|
      landing=m+start
      break if !squares.include?(landing)
      @calculated_moves<<landing
      break if hash[landing]!="   "
      end
    @moves_di_up_ri.each do |m|
      landing=m+start
      break if !squares.include?(landing)
      @calculated_moves<<landing
      break if hash[landing]!="   "
      end
    @moves_di_up_le.each do |m|
      landing=m+start
      break if !squares.include?(landing)
      @calculated_moves<<landing
      break if hash[landing]!="   "
      end
    @moves_di_do_ri.each do |m|
      landing=m+start
      break if !squares.include?(landing)
      @calculated_moves<<landing
      break if hash[landing]!="   "
      end
    @moves_di_do_le.each do |m|
      landing=m+start
      break if !squares.include?(landing)
      @calculated_moves<<landing
      break if hash[landing]!="   "
      end
  end

  def calculated_moves
    @calculated_moves
  end

  def map_moves(board)
    @calculated_moves.each do |x|
      board[x]=" Q "
    end
  end

end

board=Board.new
board.create_grid
queen=Queen.new
board.test_hash([44])
queen.calculate_moves(33, board.square_numbers, board.hash)

queen.map_moves(board.hash)
board.show_hash

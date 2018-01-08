class Board
  
  def initialize
    @square_numbers=[0, 1, 2, 3, 4, 5, 6, 7,
          10, 11, 12, 13, 14, 15, 16, 17,
          20, 21, 22, 23, 24, 25, 26, 27,
          30, 31, 32, 33, 34, 35, 36, 37,
          40, 41, 42, 43, 44, 45, 46, 47,
          50, 51, 52, 53, 54, 55, 56, 57,
          60, 61, 62, 63, 64, 65, 66, 67,
          70, 71, 72, 73, 74, 75, 76, 77]
  end

  def square_numbers
    @square_numbers
  end

  def create_board
    @board=Hash.new
    @square_numbers.each do |x|
      @board[x]="   "
    end
  end

  def board
    @board
  end
#this method fills a few squares
# she can enter a ful square but not pass it
  def test_hash(full)
    full.each do |z|
      @board[z]=" F "
    end
  end

  def show_board
    puts "   _______________________________"
    puts "7 |#{@board.fetch_values(70, 71, 72, 73, 74, 75, 76, 77).join("|")}|"
    puts "   _______________________________"
    puts "6 |#{@board.fetch_values(60, 61, 62, 63, 64, 65, 66, 67).join("|")}|"
    puts "   _______________________________"
    puts "5 |#{@board.fetch_values(50, 51, 52, 53, 54, 55, 56, 57).join("|")}|"
    puts "   _______________________________"
    puts "4 |#{@board.fetch_values(40, 41, 42, 43, 44, 45, 46, 47).join("|")}|"
    puts "   _______________________________"
    puts "3 |#{@board.fetch_values(30, 31, 32, 33, 34, 35, 36, 37).join("|")}|"
    puts "   _______________________________"
    puts "2 |#{@board.fetch_values(20, 21, 22, 23, 24, 25, 26, 27).join("|")}|"
    puts "   _______________________________"
    puts "1 |#{@board.fetch_values(10, 11, 12, 13, 14, 15, 16, 17).join("|")}|"
    puts "   ________________________________"
    puts "0 |#{@board.fetch_values(0, 1, 2, 3, 4, 5, 6, 7).join("|")}|"
    puts "   _______________________________"
    puts "    0   1   2   3   4   5   6   7"
  end
end

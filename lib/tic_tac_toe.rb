class TicTacToe
  attr_accessor :board, :input
  
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [6,4,2],
    [0,4,8],
  ]
    
  def initialize
    @board = Array.new(9, " ")
  end
  
  
  def display_board
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end
  
  def input_to_index(string)
    @input = string.to_i - 1          #converts string to an index(integer)
    #@input - 1
  end
  
  def move(input_to_index, player)              #player is the token
    @board[input_to_index] = player            #accessing the array, input_to_index points to board position
  end
  
  def position_taken?(input_to_index)
    if @board[input_to_index] == 'X' || @board[input_to_index] == 'O'
      true
    else false
    end
  end
  
  def valid_move?(input_to_index)               #remember ! returns booleans
    !position_taken?(input_to_index)  && @board[input_to_index]        
    #returns true/false based on return value of position_taken
  end
  
  def turn_count
    count = 0 
    @board.each do |x|
      if x == 'X' || x == 'O'
        count += 1
      end
    end
    count
  end
  
  def current_player
    # if turn_count.odd?
    #   return "O"
    # elsif turn_count.even?
    #   return "X"
    # end
    if turn_count % 2 == 0
      return "X"
    else
      return "O"
    end
  end
  
  def turn
    user_input = gets.chomp
    binding.pry
    position = input_to_index(user_input)
    if valid_move?(position)
      move(position, current_player)
      display_board
    else turn
    end
  end
  
  def play
    
  end
  
end
  
  

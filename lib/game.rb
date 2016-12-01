class Game
  #this is only an accesor for testing, I need to work out a better way to test though.
  attr_accessor :row_one, :row_two, :row_three
  attr_reader :turn
  def initialize
   @row_one =   ['-', '-', '-']
   @row_two =   ['-', '-', '-']
   @row_three = ['-', '-', '-']
   @turn = [:X, :O]
  end

  def play(num, column)
   row_num = num_to_row(num)
   valid_move?(row_num, column)
   game_over?
   winner?
   switch_player
   display_board
  end


  private

  def valid_move?(row, column)
   raise "This row doesn't exist!" if !row
   raise "This column doesn't exist!" if column > 3
   raise "This space is filled!" if row[column -1] != '-'
   row[column -1] = @turn.first.to_s
  end

  def game_over?
   raise "Game Over!" if !row_one.include?('-') && !row_two.include?('-') && !row_three.include?('-')
  end

  def winner?
    turn = @turn.first.to_s
   if @row_one.all? {|row| row == turn } || @row_two.all? {|row| row == turn } || @row_three.all? {|row| row == turn }
     raise "#{@turn.first.to_s} wins!"
   elsif @row_one[0] == turn && @row_two[0] == turn && @row_three[0] == turn
     raise "#{@turn.first.to_s} wins!"
   elsif @row_one[1] == turn && @row_two[1] == turn && @row_three[1] == turn
     raise "#{@turn.first.to_s} wins!"
   elsif @row_one[2] == turn && @row_two[2] == turn && @row_three[2] == turn
     raise "#{@turn.first.to_s} wins!"
   elsif @row_one[0] == turn && @row_two[1] == turn && @row_three[2] == turn
     raise "#{@turn.first.to_s} wins!"
   elsif @row_one[2] == turn && @row_two[1] == turn && @row_three[0] == turn
     raise "#{@turn.first.to_s} wins!"
   else
     return
   end
  end

  def switch_player
   @turn.reverse!
  end

  def num_to_row(num)
    hash = { 1 => @row_one,
             2 => @row_two,
             3 => @row_three}
    hash[num]
  end

  def display_board
  puts "    ---1----2----3-\n
  1#{@row_one} \n
  2#{@row_two}\n
  3#{@row_three}\n
  ---------------"
  puts "   It's #{@turn.first.to_s}'s go next!\n"
end
end

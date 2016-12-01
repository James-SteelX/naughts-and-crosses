class Game

  attr_reader :row_one, :row_two, :row_three, :turn

  def initialize
   @row_one =   ['-', '-', '-']
   @row_two =   ['-', '-', '-']
   @row_three = ['-', '-', '-']
   @turn = [:X, :O]
  end

  def play(num, column)
   row_num = num_to_row(num)
   valid_move?(row_num, column)
   row_num[column -1] = @turn.first.to_s
   switch_player
  end


  private

  def valid_move?(row, column)
   raise "This row doesn't exist!" if !row
   raise "This column doesn't exist!" if column > 3
   raise "This space is filled!" if row[column -1] != '-'
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
end

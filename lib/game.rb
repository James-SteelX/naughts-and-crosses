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
   row_num[column -1] = @turn.first.to_s
   switch_player
  end


  private

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

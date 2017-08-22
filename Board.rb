load 'Player.rb'

class Board

  attr_writer :board_player

  def initialize
    @board_player = Player.new
  end
  
  @@main_board = Hash["A1" => '#', "B1" => '#', "C1" => '#',
                    "A2" => '#', "B2" => '#', "C2" => '#',
                    "A3" => '#', "B3" => '#', "C3" => '#']
  WIN_KEYS = [
                ["A1", "A2", "A3"],
                ["B1", "B2", "B3"],
                ["C1", "C2", "C3"],
                ["A1", "B2", "C3"],
                ["C1", "B2", "A3"],
                ["A1", "B1", "C1"],
                ["A2", "B2", "C2"],
                ["A3", "B3", "C3"]
               ];
  
  def check_win
        someone_won = false
        WIN_KEYS.each do |x,y,z|
          if @@main_board[x] === 'X' && @@main_board[y] === 'X' && @@main_board[z] === 'X'
            someone_won = true 
            display_winner("X") 
          elsif @@main_board[x] === 'O' && @@main_board[y] === 'O' && @@main_board[z] === 'O'
            someone_won = true  
            display_winnner("O") 
          end
        end
        return someone_won #or simply someone_won
  end
  
  def display_winner(winner)
    draw_board()
    puts "#{winner} is the winner!"
  end
  
  
  def draw_board
    sleep 0.15  #I want the user to notice the change 
    system ("cls")
    puts " "
      puts "Current Board"
      puts " "
      puts "    A B C" 
      puts "  1 #{@@main_board['A1']} #{@@main_board['B1']} #{@@main_board['C1']}" 
      puts "  2 #{@@main_board['A2']} #{@@main_board['B2']} #{@@main_board['C2']}" 
      puts "  3 #{@@main_board['A3']} #{@@main_board['B3']} #{@@main_board['C3']}" 
      puts " "
  end
  
  def reset_board
        @@main_board = Hash["A1" => '#', "B1" => '#', "C1" => '#',
                    "A2" => '#', "B2" => '#', "C2" => '#',
                    "A3" => '#', "B3" => '#', "C3" => '#']
  end
  
  def to_change (key, value)
    board_keys = @@main_board.keys
    if board_keys.include?(key) && @@main_board[key] == '#'
      change_board(key, value)
      @board_player.switch_player
    else
      puts " "
      puts "It doesn't include this key or field is filled!"
      puts "Give the proper field value!"
      sleep 1.5
    end
  end


  private
  def change_board(key, value)
    @@main_board[key] = value;
    $steps += 1
  end
  
end
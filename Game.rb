load 'Player.rb'
load 'Board.rb'

class Game 
    
    def initialize
      @there_is_a_winner = false
      $steps = 0
    end
    
    def game_loop
      mainBoard = Board.new()
      mainPlayer = Player.new()
      until @there_is_a_winner || $steps == 9
        mainBoard.draw_board
        mainBoard.to_change(mainPlayer.get_field, $currentPlayer)
        if mainBoard.check_win === true 
          @there_is_a_winner = true
        end
      end
      restart_game(mainBoard)
    end

    def restart_game(mainBoard)
        if !@there_is_a_winner
          puts "No one won!"
        end
        puts "Do you want to play again? Y/N"
        restart_decision = gets.chomp
      if restart_decision == "Y"
         @there_is_a_winner = false
         $steps = 0
         mainBoard.reset_board()
         game_loop()
      elsif restart_decision == "N"
          puts "All right, hope you enjoyed the game!"
          puts "Hit CTRL + C to exit!"
          sleep 
      else 
        restart_game(mainBoard)
      end
    end

end

my_game = Game.new
my_game.game_loop()
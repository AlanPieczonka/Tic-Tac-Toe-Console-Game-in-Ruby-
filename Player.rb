class Player
    
    def initialize
       $currentPlayer = "X"
    end
    
    def switch_player
      $currentPlayer == "X" ? $currentPlayer = "O" : $currentPlayer = "X"
    end
    
    def get_field
      puts "Current player: " + $currentPlayer
      puts "Give me the proper field value (e.g. A2), #{$currentPlayer} !"
      user_key = gets.chomp
      return user_key
    end
    
end
# Board module prints the board
module Board
  # when the board method is called, it will print a "game board" of tic-tac-toe.
  # each value for @spaces[index] is what has been saved to @spaces array in the
  # TicTacToe class.
  def board
    puts "#{@spaces[0]}  |  #{@spaces[1]}  |  #{@spaces[2]}"
    puts "______________"
    puts "#{@spaces[3]}  |  #{@spaces[4]}  |  #{@spaces[5]}"
    puts "______________"
    puts "#{@spaces[6]}  |  #{@spaces[7]}  |  #{@spaces[8]}"
  end
end

# module will change a space into X or O, depending on which player is called
module Move
  # each method within the module will overwrite @spaces[index-1]
  def player_one_move(choice)
    puts "Player one chose spot #{@spaces[choice-1]}"
    puts
    @spaces[choice-1] = "X"
  end

  def player_two_move(choice)
    puts "Player two chose spot #{@spaces[choice-1]}"
    puts
    @spaces[choice-1] = "O"
  end
end


module GameEnd
  # this check_game_status method is called at the end each player move to see if there is a winner
  def check_game_status(move_count)
    ##########PLAYER 1 WIN CONDITIONS
    if @spaces[0] == "X" && @spaces[1] == "X"  && @spaces[2] == "X"
      puts "Player 1 is the winner!"
      @game_end = true
    elsif @spaces[3] == "X" && @spaces[4] == "X"  && @spaces[5] == "X"
      puts "Player 1 is the winner!"
      @game_end = true
    elsif @spaces[6] == "X" && @spaces[7] == "X"  && @spaces[8] == "X"
       puts "Player 1 is the winner!"
      @game_end = true
    elsif @spaces[0] == "X" && @spaces[3] == "X"  && @spaces[6] == "X"
      puts "Player 1 is the winner!"
      @game_end = true
    elsif @spaces[1] == "X" && @spaces[4] == "X"  && @spaces[7] == "X"
      puts "Player 1 is the winner!"
      @game_end = true
    elsif @spaces[2] == "X" && @spaces[5] == "X"  && @spaces[8] == "X"
      puts "Player 1 is the winner!"
      @game_end = true
    elsif @spaces[0] == "X" && @spaces[4] == "X"  && @spaces[8] == "X"
      puts "Player 1 is the winner!"
      @game_end = true
    elsif @spaces[2] == "X" && @spaces[4] == "X"  && @spaces[6] == "X"
      puts "Player 1 is the winner!"
      @game_end = true
    end
    ##########PLAYER 2 WIN CONDITIONS
    if @spaces[0] == "O" && @spaces[1] == "O"  && @spaces[2] == "O"
      puts "Player 2 is the winner!"
      @game_end = true
    elsif @spaces[3] == "O" && @spaces[4] == "O"  && @spaces[5] == "O"
      puts "Player 2 is the winner!"
      @game_end = true
    elsif @spaces[6] == "O" && @spaces[7] == "O"  && @spaces[8] == "O"
       puts "Player 2 is the winner!"
      @game_end = true
    elsif @spaces[0] == "O" && @spaces[3] == "O"  && @spaces[6] == "O"
      puts "Player 2 is the winner!"
      @game_end = true
    elsif @spaces[1] == "O" && @spaces[4] == "O"  && @spaces[7] == "O"
      puts "Player 2 is the winner!"
      @game_end = true
    elsif @spaces[2] == "O" && @spaces[5] == "O"  && @spaces[8] == "O"
      puts "Player 2 is the winner!"
      @game_end = true
    elsif @spaces[0] == "O" && @spaces[4] == "O"  && @spaces[8] == "O"
      puts "Player 2 is the winner!"
      @game_end = true
    elsif @spaces[2] == "O" && @spaces[4] == "O"  && @spaces[6] == "O"
      puts "Player 2 is the winner!"
      @game_end = true
    end

    # Checks for game win condition FIRST. If there is no winner AND all moves used,
    # then this statement will execute and end the game
    if move_count == 9 && !@game_end
      puts "The game ends in a tie."
      @game_end = true
    end
  end
end

# class Spaces has all board spaces stored as an array
class TicTacToe
  include Board
  include Move
  include GameEnd

  attr_accessor :game_end # allow rewriting since game loop requires it


  def initialize
    @spaces = [1,2,3,4,5,6,7,8,9]
    @game_end = false
  end

  def get_value(choice)
    @spaces[choice - 1]
  end

end

def game()
  move_count = 0
  game = TicTacToe.new

  puts "Let\'s play Tic-Tac-Toe!"
  puts "The game will alternate between player 1 (X's) and player 2 (O's)."
  puts "To make a move, type the number of the space and press enter."
  game.board
  # main game loop
  until game.game_end

    # loop for player one's moves
    player_turn = false
    until player_turn
      puts "Player 1, make a selection."
      puts
      choice = gets.chomp.to_i
      if game.get_value(choice) == "X" || game.get_value(choice) == "O" || game.get_value(choice) == 0
        puts "Invalid entry. Try again."
      else
        choice
        player_turn = true
      end
    end
    game.player_one_move(choice)
    game.board
    move_count += 1
    game.check_game_status(move_count)
    if game.game_end == true # needed, otherwise code will continue to player 2
      break
    end


    # loop for player two's moves
    player_turn = false
    until player_turn
      puts "Player 2, make a selection."
      puts
      choice = gets.chomp.to_i
      if game.get_value(choice) == "X" || game.get_value(choice) == "O" || game.get_value(choice) == 0
        puts "Invalid entry. Try again."
      else
        choice
        player_turn = true
      end
    end

    game.player_two_move(choice)
    game.board
    move_count += 1
    game.check_game_status(move_count)

  end
  puts "Game Over"
end

game()


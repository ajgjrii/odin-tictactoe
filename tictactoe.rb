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
    # Player One Win Conditions
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
    # Player Two Win Conditions
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
  include Board # need module to print a board
  include Move # need module to overwrite @spaces[index] with player move
  include GameEnd # need module to check for winner or tie

  attr_accessor :game_end # allow rewriting since game loop requires it

  def initialize
    @spaces = [1,2,3,4,5,6,7,8,9] # available spaces as an array
    @game_end = false # game_end is false when initialized; used for until loop
  end

  def get_value(choice) # used to check value in @spaces array
    @spaces[choice - 1] # remember indexed values are one less than counted values
  end

end

def game()
  move_count = 0 # once move_count = 9, tie message prints if no winner
  game = TicTacToe.new # creates new instance of TicTacToe class

  # next three lines give a brief introduction about game and how to play
  puts "Let\'s play Tic-Tac-Toe!"
  puts "The game will alternate between player 1 (X's) and player 2 (O's)."
  puts "To make a move, type the number of the space and press enter."
  game.board # board method from Board prints game board when called for variable game

  # main game loop; will keep executing until winner or 9 turns completed
  until game.game_end # game is variable, game.game_end is instance variable

    # PLAYER ONE MOVE START
    player_turn = false # set to false to create until loop
    until player_turn # player_turn must be true to exit
      puts "Player 1, make a selection."
      puts
      choice = gets.chomp.to_i # player one gives their choice
      # if statement looks for claimed spots or invalid user input
      if game.get_value(choice) == "X" || game.get_value(choice) == "O" || game.get_value(choice) == 0
        puts "Invalid entry. Try again." # returns to top of this loop
      else
        choice # returns choice to be used for player move
        player_turn = true # changed player_turn to exit loop
      end
    end
    game.player_one_move(choice) # sets space to "X"
    game.board # prints board with the update
    move_count += 1 #adds to the move counter
    game.check_game_status(move_count) # looking to see if there are winning conditions
    if game.game_end == true # needed, otherwise code will execute despite game ending
      break
    end
    # PLAYER ONE MOVE END

    # PLAYER TWO MOVE START
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
    # PLAYER TWO MOVE END
  end

  puts "Game Over" # prints when game loop terminates
end

game()


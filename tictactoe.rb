# Board module prints the board
module Board
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
  def player_one_move(choice)
    @spaces[choice-1] = "X"
  end

  def player_two_move(choice)
    @spaces[choice-1] = "O"
  end
end

module GameOver(moves)
  puts "Moves taken: #{moves}"
  if moves == 9
    puts "The game ends in a tie."
    game_over = true
  end
end
# class Spaces has all board spaces stored as an array
class TicTacToe
  include Board
  include Move
  include GameOver


  def initialize
    @spaces = [1,2,3,4,5,6,7,8,9]
  end

  def get_value(choice)
    @spaces[choice - 1]
  end

end

def game()
  game_end = false
  move_count = 0
  game = TicTacToe.new

  puts "Let\'s play Tic-Tac-Toe!"
  puts "The game will alternate between player 1 (X's) and player 2 (O's)."
  puts "To make a move, type the number of the space and press enter."
  game.board
  # main game loop
  until game_end

    # ##############################Player 1 move
    puts "Player 1, make a selection."
    choice = gets.chomp.to_i

    game.player_one_move(choice)
    game.board
    move_count += 1
    game.GameOver(move_count)

    # ##############################Player 2 move
    puts "Player 2, make a selection."
    choice = gets.chomp.to_i
    game.player_two_move(choice)
    game.board
    move_count += 1
    game.GameOver(move_count)



    end
  end
end


game()

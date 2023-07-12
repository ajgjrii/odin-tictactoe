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

# class Spaces has all board spaces stored as an array
class Spaces
  include Board
  include Move

  def initialize
    @spaces = [1,2,3,4,5,6,7,8,9]
  end

  def get_value(choice)
    @spaces[choice - 1]
  end

end

def game()
  game_end = false

  until game_end
    move_count = 0

    # this will end the game if there are no winning conditions detected
    if move_count == 9
      game_end = true
    end
  end
end


spaces = Spaces.new
spaces.board
spaces.player_one_move(1)
spaces.board
spaces.player_two_move(5)
spaces.board

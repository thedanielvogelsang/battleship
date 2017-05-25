require_relative "./game_init"

class ReadBattleship
  def initialize
    puts "Welcome to BATTLESHIP"
    print "\n"
    print "Would you like to (p)lay, read the (i)nstructions, or (q)uit?\n>"
    init_answer = gets.chomp
    if init_answer == "q"
      nil
    elsif init_answer == "i"
      @instructions = "\n\nThis is a simulation of the Battleship(c) board game.\n\nIn this version, you and the computer will place your ships\n<a submarine (your 2-unit boat) and a destroyer (3-unit)>\non a simple 4x4 board, letters A-D for columns, 1-4 for rows.\n\nAfter ships are placed, you will take turns firing\n on your enemy's ships by guessing a coordinate (ex: A3)\n and hitting Enter. Hits are assigned the letter 'H' on\n the gameboard, 'M' for misses.\n\nThe first player to sink all their enemy's ships wins!"
      print @instructions.rjust(10)+"\n\n>"
      gets.chomp
      ReadBattleship.new
    elsif init_answer == "p"
      puts "BOOTING UP!"
      GameInit.new
    else
      puts "ERROR: That is not a valid entry!"
      ReadBattleship.new
    end
  end
end

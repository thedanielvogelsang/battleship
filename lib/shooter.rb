require 'eval_battleship'

class Shooter
  def initialize(computer_boats, person_boats)
    @person_boats = person_boats
    @computer_boats = computer_boats
    puts "Let's play some Battleship! You fire first.\n>"
    gets.chomp
  end
end

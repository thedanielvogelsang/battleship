require './lib/board'

class Printer
  attr_reader :computer, :person
  def initialize
    @person = Board.new
    @computer = Board.new
  end

  def update(player, location, shot)
    if player == "person"
      @person.update(location, shot)
    elsif player == "computer"
      @computer.update(location, shot)
    end
  end

  def print_me(arg)
    if arg == "person"
      @person.print_me
    elsif arg == "computer"
      @computer.print_me
    end
  end
end

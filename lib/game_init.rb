require './lib/eval_battleship'
require './lib/shooter'
require './lib/messages'
require './lib/placement_check'

class GameInit
  attr_reader :coordinates, :available_squares, :messages

  def initialize
    @available_squares = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"]
    @scoordinates = nil
    @dcoordinates = nil
    @person_boats = []
    @messages = Messages.new

    submarine_correct_coordinates?
    computer = Eval::Computer.new
    computer = computer.place_boats
    person = Eval::Person.new(@person_boats)
    person = person.person_boat_coordinates
    Shooter.new(computer, person)
    puts "Until next time!"
  end

  def submarine_correct_coordinates?
    messages.intro_message
    arg = gets.chomp
    if /[A-D1-4 A-D1-4]/.match(arg) != nil
      @scoordinates = arg.split(" ")
      if @available_squares.include?(@scoordinates[0])
        sub_placement_check(@scoordinates)
      else
        messages.invalid
        arg = gets.chomp
        submarine_correct_coordinates?(arg)
      end
    else
      messages.invalid
      arg = gets.chomp
      submarine_correct_coordinates?(arg)
    end
  end

  def sub_placement_check(arg)
    placement_check = arg[0].split(//)
    new_sub = PlacementCheck::Sub.new(placement_check)
    second_coordinate = new_sub.possible_sub
    if second_coordinate.include?(@scoordinates[1]) ##have this be part of above method
        @available_squares.delete_if {|score|
          @scoordinates.include?(score)
          }
          messages.enter_next
          second_boat = gets.chomp
          destroyer_correct_coordinates?(second_boat)
    else
        messages.invalid_sub
        answer = gets.chomp
        submarine_correct_coordinates?(answer)
    end
  end

  def destroyer_correct_coordinates?(arg)
    if arg.length == 5 && arg.include?(" ")
      @dcoordinates = arg.split(" ")
      if @available_squares.include?(@dcoordinates[0]) && @available_squares.include?(@dcoordinates[1])
        dest_placement_check(@dcoordinates)
      else
        messages.invalid_overlap
        arg = gets.chomp
        destroyer_correct_coordinates?(arg)
      end
    else
      messages.invalid
      arg = gets.chomp
      destroyer_correct_coordinates?(arg)
    end
  end

  def dest_placement_check(arg)
    placement_check = arg[0].split(//)
    new_dest = PlacementCheck::Destroyer.new(placement_check)
    second_coordinate = new_dest.possible_destroy
    if second_coordinate.include?(@dcoordinates[1]) && middle == true
        @dcoordinates.insert(1, @middle_position)
        @person_boats.push(@scoordinates, @dcoordinates)
    else
      messages.invalid_destroyer
      arg = gets.chomp
      destroyer_correct_coordinates?(arg)
    end
  end

  def middle
    split_coordinates = @dcoordinates.map{|coord| coord.split(//)}
    middle_letter = (split_coordinates[0][0].ord + split_coordinates[1][0].ord)/2
    middle_dig = (split_coordinates[0][1].to_i + split_coordinates[1][1].to_i)/2
    @middle_position = middle_letter.chr+middle_dig.to_s
    @available_squares.include?(@middle_position)
  end
end

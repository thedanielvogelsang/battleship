require './lib/eval_battleship'

class GameInit
  attr_reader :coordinates, :available_squares

  def initialize
    @available_squares = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"]
    @scoordinates = nil
    @dcoordinates = nil
    @person_boats = []
    intro_message
    submarine_correct_coordinates?
  end

  def submarine_correct_coordinates?
    arg = gets.chomp
    if arg.length == 5 && arg.include?(" ")
      @scoordinates = arg.split(" ")
      if @available_squares.include?(@scoordinates[0])
        sub_placement_check(@scoordinates)
      else
        invalid
        arg = gets.chomp
        submarine_correct_coordinates?(arg)
      end
    else
      invalid
      arg = gets.chomp
      submarine_correct_coordinates?(arg)
    end
  end

  def sub_placement_check(arg)
    possible_sub = []
    placement_check = arg[0].split(//)
    #this could happen in its own method: pass placement_check to it
    possible_sub.push(
      (placement_check[0].ord - 1).chr + placement_check[1],
      (placement_check[0].ord + 1).chr + placement_check[1],
      placement_check[0] + (placement_check[1].to_i - 1).to_s,
      placement_check[0] + (placement_check[1].to_i + 1).to_s
    )
    if possible_sub.include?(@scoordinates[1])
      # person = Eval::Person.new
      # person.sub(@coordinates.slice[0], @coordinates.slice[1])
      @available_squares.delete_if {|score|
        @scoordinates.include?(score)
        }
        puts "Enter the squares for the three-unit ship\n>"
        second_boat = gets.chomp
        destroyer_correct_coordinates?(second_boat)
    else
      puts "Invalid coordinates for a Submarine (2units), try again!"
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
        invalid_overlap
        arg = gets.chomp
        destroyer_correct_coordinates?(arg)
      end
    else
      invalid
      arg = gets.chomp
      destroyer_correct_coordinates?(arg)
    end
  end

  def dest_placement_check(arg)
    possible_destroy = []
    placement_check = arg[0].split(//)
    #this could be all the same method
    possible_destroy.push(
      (placement_check[0].ord - 2).chr + placement_check[1],
      (placement_check[0].ord + 2).chr + placement_check[1],
      placement_check[0] + (placement_check[1].to_i - 2).to_s,
      placement_check[0] + (placement_check[1].to_i + 2).to_s
    )
    if possible_destroy.include?(@dcoordinates[1]) && middle == true
        @dcoordinates.insert(1, @middle_position)
        #initiate whole game
        @person_boats.push(@scoordinates, @dcoordinates)
        computer = Eval::Computer.new
        x = computer.place_boats
        require 'pry' ; binding.pry
        # person.dest(@dcoordinates[0], @dcoordinates[1])
        #
    else
      puts "Invalid coordinates for a Destroyer (3-units), try again! (Hint: Make sure to not overlap your submarine)"
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

  def invalid
    puts "Not Valid Coordinates. Try again with this syntax: 'A1 B1'\n>"
  end

  def intro_message
    puts "I have laid out my ships on the grid.\nYou now need to layout your two ships.\nThe first (the submarine) is two units long and the\nsecond (the destroyer) is three units long.\nThe grid has A1 at the top left and D4 at the bottom right.\n\nEnter the squares for the two-unit ship:\n>"
  end

  def invalid_overlap
    puts "Whoops! Looks like you already have a boat at one of those coordinates, or that was an invalid coordinate! Try again using a different location."
  end
end

instance = GameInit.new
# instance.submarine_correct_coordinates?(A2D2)

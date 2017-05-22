class GameInit
  attr_reader :coordinates, :available_squares

  def initialize
    # computer = Eval::Computer.new
    # computer.place_boats
    @available_squares = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"]
    puts "I have laid out my ships on the grid.\nYou now need to layout your two ships.\nThe first (the submarine) is two units long and the\nsecond (the destroyer) is three units long.\nThe grid has A1 at the top left and D4 at the bottom right.\n\nEnter the squares for the two-unit ship:\n>"
    @coordinates = nil
    first_boat = gets.chomp
    submarine_correct_coordinates?(first_boat)
  end

  def submarine_correct_coordinates?(arg)
    if arg.length == 5 && arg.include?(" ")
      @coordinates = arg.split(" ")
      placement_check(@coordinates)
    elsif arg.length == 4
      @coordinates = arg.scan(/.{2}/)
      placement_check(@coordinates)
    else
      puts "Not Valid Coordinates for a Submarine. Try again with this syntax: A1 B1!"
      arg = gets.chomp
      submarine_correct_coordinates?(arg)
    end

    if @possible_second.include?(@coordinates[1])
      # person = Eval::Person.new(@coordinates.slice[0], @coordinates.slice[1])
      @available_squares.delete_if {|score|
        @coordinates.include?(score)
        }
        puts "Enter the squares for the three-unit ship"
        answer = gets.chomp
        destroyer_coordinates(answer)
    else
      puts "Invalid second coordinate, try again!"
      arg = gets.chomp
      submarine_correct_coordinates?(arg)
    end
  end

  def placement_check(arg)
    @possible_second = []
    placement_check = arg[0].split(//)
    @possible_second.push(
      (placement_check[0].ord - 1).chr + placement_check[1],
      (placement_check[0].ord + 1).chr + placement_check[1],
      placement_check[0] + (placement_check[1].to_i - 1).to_s,
      placement_check[0] + (placement_check[1].to_i + 1).to_s
    )
    @possible_second
  end

  DEF 
end

instance = GameInit.new
# instance.submarine_correct_coordinates?(A2D2)

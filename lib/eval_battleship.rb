module Eval
  class Person
    attr_reader :person_boat_coordinates
    def initialize(person_boats)
      @person_boat_coordinates = person_boats
    end
  end

  class Computer
    attr_reader :comp_boat_coordinates
    def initialize
      @comp_available_squares = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"]
      @comp_boat_coordinates = []
    end

    def place_boats
      sub_boat_placement
      dest_boat_placement
      @comp_boat_coordinates
    end

    def sub_boat_placement
      @sub_location = []
      second_coordinate_possibilities = []
      random = @comp_available_squares.sample
      @sub_location.push(random)
      random_check = random.split(//)
      second_coordinate_possibilities.push(
        (random_check[0].ord - 1).chr + random_check[1],
        (random_check[0].ord + 1).chr + random_check[1],
        random_check[0] + (random_check[1].to_i - 1).to_s,
        random_check[0] + (random_check[1].to_i + 1).to_s
      )
      random2 = second_coordinate_possibilities.sample
      until @comp_available_squares.include?(random2)
        random2 = second_coordinate_possibilities.sample
      end
      @sub_location.push(random2)
      @comp_available_squares.delete_if {|score|
        @sub_location.include?(score)
        }
      @comp_boat_coordinates.push(@sub_location)
    end

    def dest_boat_placement
      @dest_location = []
      second_coordinate_possibilities = []
      random = @comp_available_squares.sample
      @dest_location.push(random)
      random_check = random.split(//)
      second_coordinate_possibilities.push(
        (random_check[0].ord - 2).chr + random_check[1],
        (random_check[0].ord + 2).chr + random_check[1],
        random_check[0] + (random_check[1].to_i - 2).to_s,
        random_check[0] + (random_check[1].to_i + 2).to_s
      )
      random2 = second_coordinate_possibilities.sample
      until @comp_available_squares.include?(random2)
        random2 = second_coordinate_possibilities.sample
      end
      @dest_location.push(random2)
      if middle == true
        @dest_location.insert(1, @middle_position)
      else
        dest_boat_placement
      end
      @comp_available_squares.delete_if {|score|
        @dest_location.include?(score)
        }
      @comp_boat_coordinates.push(@dest_location)
    end

    def middle
      split_coordinates = @dest_location.map{|coord| coord.split(//)}
      middle_letter = (split_coordinates[0][0].ord + split_coordinates[1][0].ord)/2
      middle_dig = (split_coordinates[0][1].to_i + split_coordinates[1][1].to_i)/2
      @middle_position = middle_letter.chr+middle_dig.to_s
      @comp_available_squares.include?(@middle_position)
    end
  end
end

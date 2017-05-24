module Eval
  class Person

  end
  class Computer
    attr_reader :boat_coordinates
    def initialize
      @comp_available_squares = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"]
      @boat_coordinates = []
    end

    def place_boats
      sub_boat_placement
      dest_boat_placement
    end

    def sub_boat_placement
      
    end

    def dest_boat_placement
    end

    def fire
    end
  end
end

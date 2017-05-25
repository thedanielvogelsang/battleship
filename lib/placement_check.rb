
module PlacementCheck
  class Sub
    attr_reader :possible_sub
    def initialize(coordinates)
      @possible_sub = []
      placement_check = coordinates
      possible_sub.push(
        (placement_check[0].ord - 1).chr + placement_check[1],
        (placement_check[0].ord + 1).chr + placement_check[1],
        placement_check[0] + (placement_check[1].to_i - 1).to_s,
        placement_check[0] + (placement_check[1].to_i + 1).to_s
        )
    end
  end

  class Destroyer
    attr_reader :possible_destroy
    def initialize(coordinates)
      @possible_destroy = []
      placement_check = coordinates
      possible_destroy.push(
        (placement_check[0].ord - 2).chr + placement_check[1],
        (placement_check[0].ord + 2).chr + placement_check[1],
        placement_check[0] + (placement_check[1].to_i - 2).to_s,
        placement_check[0] + (placement_check[1].to_i + 2).to_s
        )
    end
  end
end

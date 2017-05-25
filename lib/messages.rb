class Messages
  def invalid
    puts "Not Valid Coordinates. Try again with this syntax: 'A1 B1'\n>"
  end

  def fire_invalid
    puts "Thats not a valid coordinate, try again.\n>"
  end

  def intro_message
    puts "I have laid out my ships on the grid.\nYou now need to layout your two ships.\nThe first (the submarine) is two units long and the\nsecond (the destroyer) is three units long.\nThe grid has A1 at the top left and D4 at the bottom right.\n\nEnter the squares for the two-unit ship:\n>"
  end

  def enter_next
    puts "Enter the squares for the three-unit ship\n>"
  end

  def invalid_overlap
    puts "Whoops! Either that was an invalid coordinate, or you already have a boat at one of those coordinates! Try again using a different location."
  end

  def invalid_sub
    puts "Invalid coordinates for a Submarine (2units), try again!"
  end

  def invalid_destroyer
    puts "Invalid coordinates for a Destroyer (3-units), try again! (Hint: Make sure to not overlap your submarine)"
  end

  def hit
    puts "\nYou hit an enemy ship!\n>"
  end

  def sunk_sub
    puts "\nYou sunk the enemy's submarine!\n>"
  end

  def sunk_dest
    puts "\nYou sunk the enemy's destroyer!\n>"
  end

  def comp_sunk_sub
    puts "\nI sunk your submarine!"
  end

  def comp_hit_sub
    puts "\nI hit your sub!"
  end

  def comp_sunk_dest
    puts "\nI sunk destroyer!"
  end

  def comp_hit_dest
    puts "\nI hit your destroyer!"
  end
end

Messages.new

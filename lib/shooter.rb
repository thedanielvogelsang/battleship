require './lib/messages'
require './lib/print_battleship'

class Shooter
  attr_reader :p_sub, :p_dest, :comp_sub, :comp_dest, :messages

  def initialize(computer_boats, person_boats)
    @p_sub = person_boats.shift
    @p_dest = person_boats.pop
    @comp_sub = computer_boats.shift
    @comp_dest = computer_boats.pop
    @comp_options = gameboard
    #@p_shots = []
    @available_squares = gameboard
    @messages = Messages.new
    @board_play = Printer.new
    puts "Let's play some Battleship! You fire first, Admiral. (Ex: 'B3')\n>"
    @start_time = Time.now
    until (@p_sub.empty? && @p_dest.empty?) || (@comp_sub.empty? && @comp_dest.empty?)
      person_fire
      computer_fire
    end
  end

  def person_fire

      fire = gets.chomp
      if @comp_sub.include?(fire) || @comp_dest.include?(fire) && /[A-D1-4]/.match(fire) != nil
        check_boat_and_delete(fire)
      elsif /[A-D1-4]/.match(fire) != nil && @available_squares.include?(fire) == false#&& p_shots.include?(fire)
        puts "\nEither you already fired there, or thats invalid Sir! Am I beginning to detect intentional folly?\n"
        self.person_fire
      elsif /[A-D1-4]/.match(fire) != nil && @available_squares.include?(fire)
        puts "\nAye! A miss sir!\n"
        @available_squares.delete(fire)
        @board_play.update("person", fire, "  M  ")
        @board_play.print_me("person")
        puts "Press ENTER"
      else
        messages.fire_invalid
        puts %w(Ex: 'B3')
        self.person_fire
      end
  end

  def check_boat_and_delete(fire)
    if @comp_sub.include?(fire)
      @comp_sub.delete(fire)
      @available_squares.delete(fire)
      cond = @comp_sub.empty?
      cond ?  messages.sunk_sub : messages.hit
      #@p_shots.push(fire)
      @board_play.update("person", fire, "  H  ")
      @board_play.print_me("person")
      puts "Press ENTER"
    elsif @comp_dest.include?(fire)
      @comp_dest.delete(fire)
      @available_squares.delete(fire)
      cond = @comp_dest.empty?
      cond ?  messages.sunk_dest : messages.hit
      #@p_shots.push(fire)
      @board_play.update("person", fire, "  H  ")
      @board_play.print_me("person")
      puts "Press ENTER"
    end
    if @comp_sub.empty? && @comp_dest.empty?
      @end_time = Time.now
      gametime = @end_time - @start_time
      puts "Congratulations Sir! You've won the Battle! Nice shootin! You got 'em in only #{gameboard.length - @available_squares.length} shots!"
      puts "Game Run Time = #{gametime} seconds"
      exit!
    end
  end

  def computer_fire
    fire = @comp_options.delete(@comp_options.sample)
    gets.chomp
    puts "#{fire}, fire!"
    comp_check_boat_and_delete(fire)
  end

  def comp_check_boat_and_delete(fire)
    if @p_sub.include?(fire)
      @p_sub.delete(fire)
      cond = @p_sub.empty?
      cond ? messages.comp_sunk_sub : messages.comp_hit_sub
      @board_play.update("computer", fire, "  H  ")
      @board_play.print_me("computer")
      puts "Your turn!\n>"
    elsif @p_dest.include?(fire)
      @p_dest.delete(fire)
      cond = @p_dest.empty?
      cond ? messages.comp_sunk_dest : messages.comp_hit_dest
      @board_play.update("computer", fire, "  H  ")
      @board_play.print_me("computer")
      puts "Your turn!\n>"
    else
      puts "\nDarn, I missed!"
      @board_play.update("computer", fire, "  M  ")
      @board_play.print_me("computer")
      puts "Your turn!\n>"
    end
    if @p_sub.empty? && @p_dest.empty?
      @end_time = Time.now
      gametime = @end_time - @start_time
      puts "I must've outsmarted you this time. Sorry about that.\n It only took me #{gameboard.length - @available_squares.length} shots!"
      puts "Game Run Time = #{gametime} seconds"
    end
  end

  def gameboard
    ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"]
  end
end

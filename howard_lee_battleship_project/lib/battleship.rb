require_relative "board"
require_relative "player"

class Battleship

	def initialize(n)
		@player = Player.new
		@board = Board.new(n)
		@remaining_misses = @board.size / 2 
	end 

	attr_reader :board, :player


	def start_game
		@board.place_random_ships
		@board.print
        puts "Number of ships: #{@board.num_ships}"
	end 

	def lose?
		if @remaining_misses <= 0  
			puts "You lose"
			return true
		else 
			return false 
		end 
	end 

	def win?
		if @board.num_ships == 0
			puts "You win!"
			return true 
		end 
		return false 
	end 

	def game_over?
		if win? || lose?
			return true 
		end 
		return false 
	end 

	def turn
		if @board.attack(@player.get_move) == false 
			@remaining_misses -= 1
		    puts "Remaining misses: #{@remaining_misses}"
		end 
		@board.print
		puts "Remaining misses: #{@remaining_misses}"

	end 

end

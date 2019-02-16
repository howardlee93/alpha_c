class Board

	def initialize(n)
		@grid = Array.new(n){Array.new(n, :N)} 
		@size = n * n 

	end 

	attr_reader :size  

	def [](ind_pair)
		row, col = ind_pair
	  @grid[row][col]

	end 

	def []=(pos, val)
		row, col = pos
		@grid[row] [col] = val

	end

	def num_ships 
		@grid.flatten.count(:S)
	end 

	def attack(pos)
		if self[pos] == :S
			self[pos] = :H
			p "You sunk my ship!"
			true 
		else  
			self[pos] = :X
			false 
		end 
	end 

	def place_random_ships
		quarter = @size / 4 
		while self.num_ships < quarter
			rand_col = rand(0...@grid.length)
			rand_row = rand(0...@grid.length)
			self[[rand_row, rand_col]] = :S
		end 
	end 

	def hidden_ships_grid
		@grid.map do |row|
			row.map do |elem|
				if elem == :S
					elem = :N
				else 
					elem
				end 
			end 
		end 
	end 

	def self.print_grid(grid)
		grid.each do |row|
			puts row.join(" ")
		end 
	end 

	def cheat
		Board.print_grid(@grid)

	end 

	def print
		Board.print_grid(hidden_ships_grid)
	end 

end 


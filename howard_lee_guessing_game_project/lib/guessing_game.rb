class GuessingGame
	def initialize(min,max)
		@min = min 
		@max = max 
		@secret_num = rand( min..max )
		@num_attempts = 0
		@game_over = false 
	end 

	def num_attempts
		@num_attempts
	end 

	def game_over?
		@game_over 
	end 

	def check_num(num)
		@num_attempts +=1

		if num == @secret_num
			@game_over = true
			p "you win"			
		elsif num < @secret_num
			@game_over = false 
			p "too small"
		else 
			@game_over = false 
			p "too big"
		end
	end 

	def ask_user
		print "enter a number"
		user_input = gets.chomp
		check_num(user_input.to_i)
	end 

end

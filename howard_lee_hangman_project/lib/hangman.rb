class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
  	DICTIONARY.sample 
  end 

  def initialize
  	@random_word = Hangman.random_word
  	@secret_word = @random_word
  	@guess_word = Array.new(@secret_word.length,"_")
  	@attempted_chars = []
  	@remaining_incorrect_guesses = 5
  end 

  def guess_word
  	@guess_word
  end 

  def attempted_chars
  	@attempted_chars
  end 

  def remaining_incorrect_guesses
  	@remaining_incorrect_guesses
  end 

  def already_attempted?(char)
  	@attempted_chars.include?(char)
  end 

  def get_matching_indices(guess)
  	matched =[]
  	@secret_word.each_char.with_index do |char, i|
  		if char == guess 
  			matched << i
  		end 
  	end 
  	matched
  end 

  def fill_indices( char, arr )
  	arr.each {|i| @guess_word[i] = char }

  end 


#part two

	def try_guess(char)
		if already_attempted?(char)
			p "already atempted "
			return false 
		else 
			attempted_chars << char 
			matches = self.get_matching_indices(char)
			if matches == []
				@remaining_incorrect_guesses -= 1 
			else 
				self.fill_indices(char, matches)
			end 
		true 
		end 
	end 

  def ask_user_for_guess
  	puts 'Enter a char:'
  	guess = gets.chomp
  	try_guess(guess)
  end 

  def win?
  	if @guess_word.join() == @secret_word
  		puts "WIN"
  		return true 
  	end  
  	false  
  end 

  def lose?
  	if @remaining_incorrect_guesses == 0 
  		print "LOSE"
  		return true 
  	end 
  	false 
  end 

  def game_over?
  	if win? || lose?
  		p @secret_word
  		return true 
  	end 
  false 
  end 


end

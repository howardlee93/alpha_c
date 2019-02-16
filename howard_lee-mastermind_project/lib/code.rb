class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(chars)
  	chars.all? {|char|POSSIBLE_PEGS.include?(char.upcase)}
  	
  end 

  def initialize(chars)
  	if !Code.valid_pegs?(chars)
  		raise "error"
  	end 
  	@pegs = chars.map(&:upcase)

  end 

  attr_reader :pegs

  def self.random(length)
  	arr = []
  	(0...length).each { arr << POSSIBLE_PEGS.keys.sample }
  	Code.new(arr)

  end  

  def self.from_string(pegs)
  	Code.new(pegs.chars)
  end 

  def [](ind)
  	@pegs[ind]
  end 

  def length
  	@pegs.length
  end 
  
  def num_exact_matches(guess)
  	count = 0
  	guess.pegs.each_with_index do |peg, i|
  		if self.[](i) == peg
  			count += 1
  		end 
  		
  	end 
  	return count 
  end 

  def num_near_matches(guess)
  	count = 0
  	guess.pegs.each_with_index do |peg, i|
  		if self.[](i) != peg && @pegs.include?(peg)
  			count += 1
  		end 
  		
  	end 
  	return count 

  end 

  def ==(other_instance)
  	self.pegs == other_instance.pegs 
  end 

end

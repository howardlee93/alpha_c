# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
	def span
		self.max - self.min unless self == []
	end 

	def average
		self.sum.to_f/ self.length unless self == [] 

	end 

	def median 
		return nil if self == []
		midpoint = self.length/2 
		if self.length.odd?
			return self.sort[midpoint]
		else 
			return (self.sort[midpoint-1] + self.sort[midpoint]) / 2.0 
		end 

	end 

	def counts
		count = Hash.new { |hash, key| hash[key] = 0 }
		self.each do |elem|
			count[elem] += 1 
		end 
		return count 

	end 


	def my_count (val)
		count = 0
		self.each do |elem|
			if elem == val
				count += 1 
			end 
		end 
		return count 
	end

	def my_index(val)
    	self.each_with_index { |elem, i| return i if elem == val }
    	nil
  
	end 


	def my_uniq
		elements = Hash.new(0)
		self.each do |elem|
			elements[elem] += 1
		end 
		return elements.keys 
	end 


p ["a", "b", "a", "a", "b"].my_uniq
	def my_transpose
		rows = self[0].length
		new_nest = Array.new(rows) {Array.new(rows) }
		rows.times do |r|
			rows.times do |c|
				new_nest[c][r] = self[r][c]
			end 
		end 
		new_nest
     end
end
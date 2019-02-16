# # Simon Says
#
# ## Topics
#
# * functions
# * strings
# * default parameter values
#
# ## Hints
#
# When you make the second `repeat` test pass, you might break the
# **first**

def echo(str)
	str
end 

def shout(str)
	str.upcase
end 

puts shout("hello, hello ")

def repeats(str, repeat=2)
	final =[]
	repeat.times do |i|
		final << str
	end 
	final.join(" ")
end 

puts repeats("hello", 3)#("hello hello hello")

def start_of_word(str, part= 1)
	str[0..part-1]

end 
puts start_of_word("hello",2)



def first_word(str)
	str_arr = str.split(" ")
	str_arr[0]
end 

puts first_word("hi bitch")

def titleize(str)
	newstr = []
	little_words = ["and", "or", "of", "in", "a", "the", "over"]
	str = str.split(" ")
	str.each do |word|
		newstr << word.capitalize unless little_words.include?(word)
		newstr << word if little_words.include?(word)
	end 
	if str.length == 1
		return str[0].capitalize
	else 
		return str[0].capitalize + " " + newstr[1..-1].join(" ")
	end 
end 
puts titleize("cat")#("The Bridge over the River Kwai")
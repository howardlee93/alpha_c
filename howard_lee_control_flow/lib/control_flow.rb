# EASY

# Return the argument with all its lowercase characters removed.
def destructive_uppercase(str)
	str.each_char do |char|
    	str.delete!(char) if char != char.upcase
	end 
str
end

# Return the middle character of a string. Return the middle two characters if
# the word is of even length, e.g. middle_substring("middle") => "dd",
# middle_substring("mid") => "i"
def middle_substring(str)
	if str.length % 2 != 0
		return str[(str.length )/2]
	else
		return str[(str.length/2) -1..(str.length)/2]
	end 
end

# Return the number of vowels in a string.
#VOWELS = %w(a e i o u)
def num_vowels(str)
	str.downcase.count("aeiou")

end

# Return the factoral of the argument (num). A number's factorial is the product
# of all whole numbers between 1 and the number itself. Assume the argument will
# be > 0.
def factorial(num)
if num == 0
  return 1
 else
  return num * factorial(num -1)
 end
end

puts factorial(3)

# MEDIUM

# Write your own version of the join method. separator = "" ensures that the
# default seperator is an empty string.
def my_join(arr, separator = "")
	newstr = ""
	arr.each_index do |i|
		newstr += arr[i]
		newstr += separator unless i == arr.length - 1

	end
newstr

end



# Write a method that converts its argument to weirdcase, where every odd
# character is lowercase and every even is uppercase, e.g.
# weirdcase("weirdcase") => "wEiRdCaSe"
def weirdcase(str)
	newstr = ""
	letter = str.chars
  	letter.each_index do | i|
    	if i.odd?
      		newstr += letter[i].upcase
    	else
      		newstr += letter[i].downcase
    	end
  	end
	newstr
end

puts weirdcase('cat')

# Reverse all words of five more more letters in a string. Return the resulting
# string, e.g., reverse_five("Looks like my luck has reversed") => "skooL like
# my luck has desrever")
def reverse_five(str)
	result_arr = []
	str.split.each do |word|
		if word.length > 4
			result_arr << word.reverse
		else 
			result_arr << word
		end 
	end 
	result_arr.join(" ")


end
puts reverse_five("Looks like my luck has reversed") #{"skooL like
# my luck has desrever")

# Return an array of integers from 1 to n (inclusive), except for each multiple
# of 3 replace the integer with "fizz", for each multiple of 5 replace the
# integer with "buzz", and for each multiple of both 3 and 5, replace the
# integer with "fizzbuzz".
def fizzbuzz(n)
	newarr = []
	(1..n).each do |i|
		if i % 3 == 0 && i % 5 == 0
			newarr << "fizzbuzz"
		elsif i % 3 == 0
			newarr <<"fizz"
		elsif i % 5 == 0
			newarr << "buzz"
		else 
			newarr << i
		end 
	end 
	return newarr 
			
end
print fizzbuzz(30)



# HARD

# Write a method that returns a new array containing all the elements of the
# original array in reverse order.
def my_reverse(arr)
	newarr = []
	arr.each do |elem|
		newarr.unshift(elem)
	end 
	newarr
end


# Write a method that returns a boolean indicating whether the argument is
# prime.
def prime?(num)
	if num == 0 || num == 1
		return false 
	end 
	(2..num/2).each do | i|
		if num % i == 0 
		 return false 
		end 
	end 
	true 
end

puts prime?(2)

# Write a method that returns a sorted array of the factors of its argument.
def factors(num)
	newarr = []
	(1..num).each do |i|
		if num % i  == 0
			newarr << i
		end 
	end 
	return newarr
end

print factors(10)

# Write a method that returns a sorted array of the prime factors of its argument.
def prime_factors(num)
	newarr = []
	factors(num).each do |factor|
		newarr << factor if prime?(factor)
	end 
	return newarr 
end

print prime_factors(12)

# Write a method that returns the number of prime factors of its argument.
def num_prime_factors(num)
	return prime_factors(num).length 

end


# EXPERT

# Return the one integer in an array that is even or odd while the rest are of
# opposite parity, e.g. oddball([1,2,3]) => 2, oddball([2,4,5,6] => 5)
def oddball(arr)
	even = []
	odd = []
	arr.each do |i|
		if i % 2 == 0
			even << i
		elsif i % 2 != 0 
			odd << i
		end 
	end 

	if even.length > odd.length
		return odd[0]
	elsif odd.length > even.length 
		return even[0]
	end 


end

puts  oddball([1,2,3]) # 2

=begin
	

 calculator


add` takes two parameters and adds them
#
# `subtract` takes two parameters and subtracts the second from the first
#
# `sum` takes an *array* of parameters and adds them all together

# * `multiply` which multiplies two numbers together
# * `power` which raises one number to the power of another number
# * `[factorial](http://en.wikipedia.org/wiki/Factorial)` (check
#   Wikipedia if you forgot your high school math).

=end 

def add (num1,num2)
	num1 + num2
end 

def subtract(num1, num2)
	num1 - num2 
end 

puts subtract(10,4)


def sum(array)
	array.sum 
end 

puts sum ([1,2,3])

def multiply(num1,num2,num = 1)
	num1 *num2* num
end 
puts multiply(2,3,4)


def power(num1,num2)
	num1 ** num2
end

def factorial(n)
	if n < 0
		return nil 
 	end
 	value = 1
 	while n > 0
   		value = value * n 
   	n -= 1 
 		end
 	return value 
end

puts factorial(0)
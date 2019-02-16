

def reverser(&prc)
	prc.call.split(" ").map{|str| str.reverse}.join(" ")
end
 

def adder(num = 1, &prc)
	prc.call + num
end 


def repeater(n = 1 , &prc)
	(n).times{yield}
end 



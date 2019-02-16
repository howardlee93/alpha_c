#convert temperatures back and forth between fah and cel

def ftoc(fah)
	cel = (fah.to_f - 32.0) * (5.0/9.0)
end 

def ctof(cel)
	fah = (cel.to_f) *(9.0/5.0) + 32

end 

puts ftoc(60)
puts ctof(40)
puts 0.5 - 0.4 - 0.1
# EASY

# Define a method that, given a sentence, returns a hash of each of the words as
# keys with their lengths as values. Assume the argument lacks punctuation.
def word_lengths(str)
	result = Hash.new(0)
	str.split(" ").each do |word|
		result[word.downcase] = word.length
	end 
	result 

end

puts word_lengths("hash is bash")
# Define a method that, given a hash with integers as values, returns the key
# with the largest value.
def greatest_key_by_val(hash)
	result_hash = hash.sort_by{|k,v|v}[-1]	
	result_hash[0]

end

# Define a method that accepts two hashes as arguments: an older inventory and a
# newer one. The method should update keys in the older inventory with values
# from the newer one as well as add new key-value pairs to the older inventory.
# The method should return the older inventory as a result. march = {rubies: 10,
# emeralds: 14, diamonds: 2} april = {emeralds: 27, moonstones: 5}
# update_inventory(march, april) => {rubies: 10, emeralds: 27, diamonds: 2,
# moonstones: 5}
def update_inventory(older, newer)
	newer.each do |key,value|
		older[key] = value
	end 
	older 

end

# Define a method that, given a word, returns a hash with the letters in the
# word as keys and the frequencies of the letters as values.
def letter_counts(word)
	word_hash = Hash.new(0)
	word.split("").each do |letter|
		word_hash[letter] += 1
	end 
	word_hash
end

# MEDIUM

# Define a method that, given an array, returns that array without duplicates.
# Use a hash! Don't use the uniq method.
def my_uniq(arr)
	uniq = Hash.new(0)
	arr.each do |elem|
		uniq[elem] += 1 
	end 
	uniq.keys 
end


puts my_uniq([1, 2, 3, 1, 1, 2])

# Define a method that, given an array of numbers, returns a hash with "even"
# and "odd" as keys and the frequency of each parity as values.
def evens_and_odds(numbers)
  	count = {:even => 0, :odd => 0}
	numbers.each do |num|
		if num % 2 == 0
			count[:even] += 1 
		elsif num % 2 != 0
			count[:odd] += 1
		end 
	end 
return count 
end

p evens_and_odds([1,2,3,1,5])

# Define a method that, given a string, returns the most common vowel. Do
# not worry about ordering in the case of a tie. Assume all letters are 
# lower case.
def most_common_vowel(string)
	vowels_count = Hash.new(0)
	vowel = "aeiou"
	string.each_char do |letter|
		if vowel.include?(letter)
			vowels_count[letter] += 1
		end 
	end 
	return vowels_count.sort_by{|k,v| v}[-1].first
end

p most_common_vowel("eeiaoa")
# HARD

# Define a method that, given a hash with keys as student names and values as
# their birthday months (numerically, e.g., 1 corresponds to January), returns
# every combination of students whose birthdays fall in the second half of the
# year (months 7-12). students_with_birthdays = { "Asher" => 6, "Bertie" => 11,
# "Dottie" => 8, "Warren" => 9 }
# fall_and_winter_birthdays(students_with_birthdays) => [ ["Bertie", "Dottie"],
# ["Bertie", "Warren"], ["Dottie", "Warren"] ]
def fall_and_winter_birthdays(students)
	students_with_birthdays = students.select do |student, month|
		month >= 7 
	end 
	names = students_with_birthdays.keys 
	result = []
	names.each_index do |i|
		((i+1)...names.length ).each do |j|
		
			result << [ names[i], names[j] ]
		end 



	end 
	return result 


end


 students_with_birthdays = { "Asher" => 6, "Bertie" => 11, "Dottie" => 8, "Warren" => 9 }
 p fall_and_winter_birthdays(students_with_birthdays)
# Define a method that, given an array of specimens, returns the biodiversity
# index as defined by the following formula: number_of_species**2 *
# smallest_population_size / largest_population_size biodiversity_index(["cat",
# "cat", "cat"]) => 1 biodiversity_index(["cat", "leopard-spotted ferret",
# "dog"]) => 9
def biodiversity_index(specimens)
	unique = specimens.uniq
	species_count = {}
	unique.each do |species|
    	species_count[species] = specimens.count(species)
    end
	number_of_species = unique.length
  	smallest_species = species_count.values.min
  	largest_species = species_count.values.max

  	number_of_species ** 2 * smallest_species / largest_species


end

p biodiversity_index(["cat", "cat", "cat"])
# Define a method that, given the string of a respectable business sign, returns
# a boolean indicating whether pranksters can make a given vandalized string
# using the available letters. Ignore capitalization and punctuation.
# can_tweak_sign("We're having a yellow ferret sale for a good cause over at the
# pet shop!", "Leopard ferrets forever yo") => true
def can_tweak_sign?(normal_sign, vandalized_sign)
	normal_count = character_count(normal_sign)
	vandalized_count = character_count(vandalized_sign)

	vandalized_count.all? do |char, count|
		normal_count[char.downcase] >= count


	end 

end

def character_count(str)
	count = Hash.new (0)
	str.downcase.each_char do |char|
		if char == " "
			next 
		end 
		count[char] += 1
	end 
count 
end

p character_count("cat")


#p can_tweak_sign("We're having a yellow ferret sale for a good cause over at the pet shop!", "Leopard ferrets forever yo")# true

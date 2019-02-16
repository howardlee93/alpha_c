# # Topics
#
# * modules
# * strings
#
# # Pig Latin
#
# Pig Latin is a made-up children's language that's intended to be
# confusing. It obeys a few simple rules (below) but when it's spoken
# quickly it's really difficult for non-children (and non-native
# speakers) to understand.
#
# Rule 1: If a word begins with a vowel sound, add an "ay" sound to
# the end of the word.
#
# Rule 2: If a word begins with a consonant sound, move it to the end
# of the word, and then add an "ay" sound to the end of the word.
#
# (There are a few more rules for edge cases, and there are regional
# variants too, but that should be enough to understand the tests.)
#
# See <http://en.wikipedia.org/wiki/Pig_latin> for more details.


def translate(str)



   # Vowels to consider
    vowels = ["a", "e", "i", "o", "u"]
    
    # Special cases to consider
    two_letter_consonants = ["ch", "sh", "qu", "th", "br"]
    three_letter_consonants = ["thr", "sch", "squ"]

    words = str.split(" ")
    result = []

    words.each do |word|
      if vowels.include?(word[0])
        result.push word << "ay"
      else 
        if three_letter_consonants.include? (word[0] + word[1] + word[2])
          first_three_letters = word.slice!(0,3)
                
            # Add letters to end of word with 'ay'
            result.push word << first_three_letters << 'ay'
        elsif two_letter_consonants.include?(word[0] + word[1])
          first_two_letters = word.slice!(0,2)
            result.push word << first_two_letters << "ay"
        else 
          first_letter = word.slice!(0)
                
                # Add first letter to end of word with 'ay'
            result.push word << first_letter << 'ay'
        end #End of special consonant check
      end 
    end 
    return result.join(" ")
end

puts translate("three")
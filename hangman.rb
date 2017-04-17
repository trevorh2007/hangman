starting_sentence = "Welcome to the jungle"
sentence_array = starting_sentence.split("").map(&:downcase)
accurate_count = sentence_array - [" "]
final_sentence = starting_sentence.gsub(/[a-zA-Z]/, "_").split("")

class Correct
	def self.text
		puts "Correct! The sentence is now: #{final_sentence.join}"
	end
end

while sentence_array.count("") < accurate_count.count
	puts "Category: Song Title \nGuess a letter:"
	guess = gets.downcase.chomp
	if sentence_array.include?(guess)
		letter_index = sentence_array.find_index(guess)
		sentence_array[letter_index] = ""
		final_sentence[letter_index] = guess
		puts "Correct! The sentence is now: #{final_sentence.join}"
	else
		puts "Sorry, try again."
	end
end
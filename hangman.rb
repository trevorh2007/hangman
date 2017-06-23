require 'pry'

puts "To do a custom puzzle type custom, otherwise hit enter for a random puzzle"
if gets.chomp == ''
	puzzle = "you got a friend in me"
else
	puts "Alright what's your custom puzzle?"
	puzzle = gets.chomp.downcase
end
puzzle_array = puzzle.split("").map(&:downcase)
accurate_count = (puzzle_array - [" "]).count
final = puzzle.gsub(/[a-zA-Z]/, "_").split("")
guessed_letter = []

while final.count('_') != 0
	puts "Guess a letter:"
	guess = gets.chomp.downcase
	if guess.length > 1
		puts "Um..."
		sleep 1
		puts "That's not a letter..."
		sleep 1
		puts "So I'm just going to use the first letter: #{guess.split('').first.upcase}"
		sleep 2
		puts
		guess = guess.downcase.split('').first
	end

	if puzzle_array.include?(guess)
		s = puzzle_array.join('')
		a = (0 ... puzzle_array.length).find_all { |i| puzzle_array.join('')[i,1] == guess }.each { |i| final[i] = guess }
		letter = puzzle_array.index(guess)
		puzzle_array[letter] = " "
		# binding.pry
		if a.count > 1
			puts "Great guess! There were #{a.count} #{guess.upcase}s!"
			puts "Puzzle reads: #{final.join}"
		else
			puts "Great guess! There was a #{guess.upcase}!"
			puts "Puzzle reads: #{final.join}"
		end
	else
		if guessed_letter.include?(guess.upcase)
			puts "You already guessed #{guess.upcase}! List of guesses: #{guessed_letter.sort.join(' ')}"
		else
			puts "Sorry, no #{guess.upcase}'s try again."
			(guessed_letter << guess.upcase) unless guessed_letter.include?(guess.upcase)

			p "Wrong Letters: #{guessed_letter.sort.join(' ')}"
		end
	end
end

# puts "guess"
# guess = gets.chomp.downcase
# guessed_letter << "h"
# guessed_letter << "d"
# p guessed_letter.sort.join(' ').include?(guess)
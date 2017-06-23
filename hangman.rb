require 'terminal-table'
require_relative 'hangman_puzzles'

puts "To do a custom puzzle type custom, otherwise hit enter for a random puzzle"
if gets.chomp == ''
	puzzle = [@around_the_house.sample, @movie_quotes.sample].sample
	if @around_the_house.include?(puzzle)
		puts "Category: Around The House"
	else
		puts "Category: Movie Quotes"
	end
else
	puts "Alright what's your custom puzzle?"
	puzzle = gets.chomp.downcase
end
puzzle_array = puzzle.split("").map(&:downcase)
accurate_count = (puzzle_array - [" "]).count
@final = puzzle.gsub(/[a-zA-Z]/, "_").split("")
guessed_letter = []
count = 0

while @final.count('_') != 0
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
		a = (0 ... puzzle_array.length).find_all { |i| puzzle_array.join('')[i,1] == guess }.each { |i| @final[i] = guess }
		letter = puzzle_array.index(guess)
		puzzle_array[letter] = " "
		if a.count > 1
			puts "Great guess! There were #{a.count} #{guess.upcase}s!"
			puzzle_table
		else
			puts "Great guess! There was a #{guess.upcase}!"

			if @final.count('_') != 0
				puzzle_table
			else
				puzzle_table
				puts "Puzzle Solved!"
				puts "It took #{count} guesses!"
			end
		end
		count += 1
	else
		if guessed_letter.include?(guess.upcase)
			puts "You already guessed #{guess.upcase}! List of guesses: #{guessed_letter.sort.join(' ')}"
		else
			puts "Sorry, no #{guess.upcase}'s try again."
			(guessed_letter << guess.upcase) unless guessed_letter.include?(guess.upcase)

			p "Wrong Letters: #{guessed_letter.sort.join(' ')}"
		end
		count += 1
	end
end
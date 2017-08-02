# def get_word?(secret_word) 
#     if secret_word.class == String
#         true
#     else
#         false
#     end
# end
def get_secret_word_length(secret_word) 
    $number_of_letters_in_secret_word = $secret_word.length
end
# def check_letter?(secret_word, letter)
#     if secret_word.include? letter
#         true
#     else 
#         false
#     end
# end
def push_correct_guess_into(letter) #this function pushes a correct guess, letter, into an array
    correct_letter = [] 
    correct_letter.push letter
    # puts "#{correct_letter} is correct_letter"
    correct_letter #this calls the array so it is the last step in the function
end
def push_incorrect_guess_into(letter) #see above
    wrong_letter = []
    wrong_letter.push letter
    # puts "#{wrong_letter} is wrong_letter" 
    wrong_letter #this calls the array so it is the last step in the function
end
def set_display_word(secret_word) #this function displays the secret word with blanks 
    $display_word = [] #sets the variable equal to an empty array
    get_secret_word_length($secret_word).times do #run this function as many times as there are letters in my secret word 
        $display_word << "_" #it pushes blank spaces into the array equal to the number of letters in the word
    end    
    # p $display_word #causes the array to be shown for the tests
    $display_word
end
# def all_guessed_letters(letter)
#     guessed_letters = [] #we need new array for the combining of previous 2 letter guess arrays (correct & incorrect)
#     guessed_letters = push_incorrect_guess_into(letter)|push_correct_guess_into(letter)  #bar means "set union" which combines the 2 arrays and removes duplicates (although not needed here)
# end
def update_display_word(secret_word, letter)
    p "secret word is #{secret_word} and letter is #{letter}"
    # display_word = set_display_word(secret_word) #display word is blanks
    $secret_word_array = $secret_word.split("") #this breaks the secret word into an array of individual letters 
    counter = 0
    found = false
    $secret_word_array.each do |index|#we used the .each so that each letter in the secret word gets compared to the letter (index) ;the input within the bars is another variable which allows us to pass the letters into the do loop. technically index is the input for each letter
        if index == letter
        $display_word[counter] = letter
        found = true
        end 
    counter = counter + 1
    end
    if found == false
        # p "Wrong letter!"
        $wrong_guesses_count = $wrong_guesses_count + 1
        # puts "You only have #{10 - $wrong_guesses_count} wrong guesses left!"
    end
    # p $display_word
end
def check_winner(display_word, secret_word_array)
    if $display_word == $secret_word_array
        $solved = true
        # p "Winner, Winner, Chicken Dinner!"
    end
    if $wrong_guesses_count >= 10 
        # puts "Sorry, you lose!"
    end
end
def you_lost()
    "Uh Oh!"
end
def one_player()
    word_bank = ["puppy", "chicken", "amazon", "baseball", "yeti", "wombat", "racecar", "apple"]
     $secret_word  = word_bank.shuffle.first
    end
def two_player()
    # p "Enter secret word."
    $secret_word = gets.chomp #$ creates a global variable. Will need to be added in everywhere the variable is used. Similiar to sessions when not using Sinatra- allows you to pass data from point to point. Does not rely on cookies like sessions does.
end
def input_secret_word()
    # puts "Would you like to play one player or two? Please type one or two."
    $answer = gets.chomp
    if $answer == "two"
        two_player()
    else
        one_player()
    end
end
def input_letter()
    # p "Input letter"
    $letter = gets.chomp
    if $all_guesses.include?($letter)
        # puts "You have already guessed #{$letter} :("
    else $all_guesses << $letter
    end
end
def play_hangman(secret_word, letter) #bringing all the functions from above into this line. Going to have a do loop and a counter. Function in progress.
    if 
        check_letter?(secret_word, letter) == true
        push_correct_guess_into(letter)
    else 
        push_incorrect_guess_into(letter)
    end
end
def run_program(letter) #caling functions in order
	p "the letter is #{letter}"
    # p "Player 2: Choose a letter."
    $solved = false
    $wrong_guesses_count = 0
    # $all_guesses = []
    # #below... as long as "solved" isn't true AND wrong guesses is less than 10, update display and check for winner loops.
    while $solved == false && $wrong_guesses_count <10 #while solved is false
        update_display_word($secret_word, letter)
        # check_winner($display_word, $secret_word_array)
     #     if $all_guesses.include?(letter) != true
        	# redirect'/choices?message=already picked... pick again'
     #    # puts "You have already guessed #{$letter} :("
    	# else $all_guesses << letter
    	end
    # end
end
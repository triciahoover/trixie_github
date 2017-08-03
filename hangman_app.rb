require 'sinatra'
require_relative 'hmlogic.rb'
# i moved wrong guess outside of the function because it was being reset every time the run program was called.!!!!
$wrong_guesses_count = 0
$all_guesses = []
get '/'  do
    redirect '/splash'
end
get '/splash' do
    erb :splashscreen
end
get '/gameplay' do
    erb :gameplay
end
post '/game' do
    $secret_word = params[:secret_word] #secret word comes from gameplay.erb
    # puts "secret_word is #{$secret_word}"
    $display_word = set_display_word($secret_word) #calls function from hmlogic.rb
    # puts "display_word is #{display_word}"
    redirect '/choices'
end
get '/choices' do
    message = params[:message] || "" #double goal post is OR operator, uses logic from hmlogic.rb to determine message
    # display_word is a var set to the return of function set_display_word and arg is $secret_word / no string needed because we are not passing through redirect.....
    #!!!!!!!!!!!!!!!!!!!
    #$display_word is already set in post game above. leaving here resets value every time u are in get choices.
    # $display_word = set_display_word($secret_word)
    #!!!!!!!!!!!!!!!!!!!!
    #notice how i pass in already guessed to show letters already picked- makes for better user experience
    erb :game, locals: {display_word: $display_word, message: message, wrong_guesses_count: $wrong_guesses_count, already_guessed: $all_guesses }
end
post '/choices' do
    choice = params[:choices]
    run_program(choice)
    
    redirect '/choices'
end
# i added winner and loser route here
get'/winner' do
    "you are a winner"
end
get'/loser' do 
    "your are a loser"
end
####### end winner and loser routes
post '/gameover' do
    erb :gameover
end
get '/endscreen' do
    erb :gameover
end
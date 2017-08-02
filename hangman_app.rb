require 'sinatra'
require_relative 'hmlogic.rb'


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
	# $secret_word = params[:secret_word]
	# display_word = set_display_word($secret_word).to_s
	erb :game, locals: {display_word: $display_word, message: message, wrong_guesses_count: $wrong_guesses_count}
end

post '/choices' do
	choice = params[:choices]
	run_program(choice)
	# run_program()=params[:run_program()]
	redirect '/choices'
end


post '/gameover' do
	erb :gameover
end

get '/endscreen' do
	erb :gameover
end
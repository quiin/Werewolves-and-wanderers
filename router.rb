require 'sinatra/base'

class Router < Sinatra::Base
	
	get '/' do
		erb :game
	end

	post '/' do
		#Post handled via AJAX
		puts "Params: #{params}"
	end

end
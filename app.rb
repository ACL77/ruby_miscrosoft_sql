require 'sinatra' 
require 'tiny_tds'
require_relative 'models/player.rb'

# connect with Microsoft SQL Server
DB = TinyTds::Client.new dataserver: 'DESKTOP-9CE4NKO\SQLEXPRESS', database: 'jm_players'

# sinatra defines the available endpoints

# localhost:4567/
# home of the app
get '/' do
	erb :home
end

# localhost:4567/players
# list all players
get '/players' do
	@players = Player.all

	erb :index
end

# localhost:4567/players/new
# form to create new player
get '/players/new' do
	erb :new
end

# localhost:4567/players/1
# show player info
get '/players/:id' do
	@player = Player.find(params[:id])

	erb :show
end

# localhost:4567/players
# save the new player info
post '/players' do
	@player = Player.new(params)
	@player.save
	redirect "/players/#{@player.id}"
end

# localhost:4567/players/1/delete
# delete player
get '/players/:id/delete' do
	@player = Player.find(params[:id])
	@player.destroy

	redirect "/players"
end
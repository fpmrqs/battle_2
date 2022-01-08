require 'sinatra/base'
require 'sinatra/reloader'
require './lib/player'
require './lib/game'


class Battle < Sinatra::Base
  enable :sessions
  configure :development do
    register Sinatra::Reloader
    also_reload 'app.rb'
  end 

get '/' do
  erb(:index)
end

get '/play' do
  @game = $game
  @attack_message = session[:attack_message]
  erb(:play)
end

post '/names' do
  $player_1 = Player.new(params[:player_1_name])
  $player_2 = Player.new(params[:player_2_name])
  $game = Game.new($player_1, $player_2)
  redirect to('/play')
end

post '/attack' do
  @game = $game
  $game.attack($game.player_2)
  session[:attack_message] = "#{@game.player_1.name} attacked #{@game.player_2.name}"
  redirect to('/play')
end

run! if app_file == $0
end
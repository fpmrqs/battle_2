require 'sinatra/base'
require 'sinatra/reloader'
require './lib/player'


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
  @player_1_name = $player_1.name
  @player_2_name = $player_2.name
  @player_1_hp = $player_1.hp
  @player_2_hp = $player_2.hp
  @attack_message = session[:attack_message]
  erb(:play)
end

post '/names' do
  $player_1 = Player.new(params[:player_1_name])
  $player_2 = Player.new(params[:player_2_name])
  redirect to('/play')
end

post '/attack' do
  @player_1_name = $player_1.name
  @player_2_name = $player_2.name
  $player_1.attack($player_2)
  session[:attack_message] = "#{@player_1_name} attacked #{@player_2_name}"
  redirect to('/play')
end

run! if app_file == $0
end
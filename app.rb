require 'sinatra/base'
require 'sinatra/reloader'


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
  @player_1 = session[:player_1]
  @player_2 = session[:player_2]
  @attack_message = session[:attack_message]
  erb(:play)
end

post '/names' do
  session[:player_1] = params[:player_1]
  session[:player_2] = params[:player_2]
  redirect to('/play')
end

post '/attack' do
  @player_1 = session[:player_1]
  @player_2 = session[:player_2]
  session[:attack_message] = "#{@player_1} attacked #{@player_2}"
  redirect to('/play')
end

run! if app_file == $0
end
require 'sinatra'
require_relative 'models/game'

get '/' do
  erb :'home/index.html'
end

get '/games' do
  @games = Game.all

  erb :'games/index.html'
end

#rota
get '/games/:id' do

  #caminho do arquivo
  erb :'games/show.html'

end
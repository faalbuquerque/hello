require 'sinatra'
require_relative 'models/user'

get '/' do
  erb :'home/index.html'
end

get '/users' do
  @users = User.all

  erb :'users/index.html'
end

#rota
get '/users/:id' do

  #caminho do arquivo
  erb :'users/show.html'

end
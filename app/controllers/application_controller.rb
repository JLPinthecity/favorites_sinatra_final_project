require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "favorites"
  end

  get '/' do
    erb :index
  end

  get '/about' do
    erb :about
  end

  get '/signup' do
    erb :"users/signup"
  end

end

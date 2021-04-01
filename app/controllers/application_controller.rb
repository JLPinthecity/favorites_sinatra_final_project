require './config/environment'
require 'rack-flash' 


class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "favorites"
    use Rack::Flash
  end

  get '/' do
    erb :index
  end

  get '/about' do
    erb :about
  end

  helpers do

    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    #double pipes// or equals // if a is undefined or falsey, 
    #then evaluate b and set a to the result

  end

end

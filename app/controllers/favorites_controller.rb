class FavoritesController < ApplicationController

  get '/favorites' do 
    erb :"favorites/index"
  end

  get '/favorites/new' do
    if logged_in?
        erb :"/favorites/new"
    else
        redirect to '/login'
    end
  end

end

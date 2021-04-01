class FavoritesController < ApplicationController

  get '/favorites' do 
    erb :"favorites/index"
  end
  
end

require 'pry'
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

  post '/favorites' do
    if logged_in? 
      @favorite = current_user.favorites.create(:category => params[:favorite][:category], :name => params[:favorite][:name], :notes => params[:favorite][:notes])
      @favorite.url = Url.new(params[:url])
    
  
    binding.pry
    end
  end

  #{"favorite"=>{"category"=>"My favorite cookie recipe", 
 # "name"=>"The Best Chewy Chocolate Chip Cookies Recipe", 
 # "notes"=>"Note to self: Brown the butter.", 
 # "url"=>"https://tasty.co/recipe/the-best-chewy-chocolate-chip-cookies"}

end

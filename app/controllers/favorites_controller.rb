require 'pry'
class FavoritesController < ApplicationController

  get '/favorites' do 
    if logged_in?
      @favorites = Favorite.all 
      erb :"favorites/index"
    else
      flash[:not_logged_in] = "Please log in."
      redirect to '/login'
    end
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
      @favorite = current_user.favorites.build(:category => params[:favorite][:category], :name => params[:favorite][:name], :notes => params[:favorite][:notes])
      @favorite.url = Url.new(:link => params[:favorite][:url])
      @url = @favorite.url
      @url.user_id = current_user.id
      @url.save
        if @favorite.save
          redirect to "/favorites/#{@favorite.id}"
        else
          redirect to "/favorites/new"
        end
    else
      redirect to '/login'
    end
  end

  get '/favorites/:id' do
    if logged_in?
      @favorite = Favorite.find(params[:id])
      erb :"favorites/show"
    else
      flash[:not_logged_in] = "Please log in."
      redirect to "/login"
    end
  end  

#{"favorite"=>{"category"=>"Fave Disney World Snack", 
#"name"=>"Dole Whip", "notes"=>"Eat it fast!", 
#"url"=>"https://disneyworld.disney.go.com/dining/magic-kingdom/aloha-isle/"}}

#NEXT: favorites/:id

end
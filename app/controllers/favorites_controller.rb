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
      @favorite.url = Url.new(params[:url])
        if @favorite.save
          redirect to "/favorites/#{@favorite.id}"
        else
          redirect to "/favorites/new"
        end
    else
      redirect to '/login'
    end
end


#favorites/:id
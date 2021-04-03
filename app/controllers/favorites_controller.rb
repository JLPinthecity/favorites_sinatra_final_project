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

  get '/favorites/:id/edit' do
    if logged_in?
      @favorite = Favorite.find(params[:id])
      if @favorite.user_id == current_user.id
        erb :"/favorites/edit"
      else
        flash[:wrong_user] = "Sorry you can only edit or delete your own favorites."
        redirect to '/favorites'
      end
    else
      flash[:not_logged_in] = "Please log in."
      redirect to "/login"
    end
  end

  patch '/favorites/:id' do 
    if logged_in?
      

      



      if @favorite.user_id != current_user.id
       
        redirect to '/favorites'
      else
        erb :"/favorites/edit"
      end
    else   
      flash[:not_logged_in] = "Please log in."
      redirect to "/login"
    end
  end


  post "/favorites/:id/delete" do 
    if !logged_in?
      flash[:not_logged_in] = "Please log in."
      redirect to '/login'
    else
      @favorite = Favorite.find(params[:id])
      if @favorite.user_id != current_user.id
        flash[:wrong_user] = "Sorry you can only edit or delete your own favorites."
        redirect to '/favorites'
      else
        @favorite.delete
        flash[:delete_success] = "You have successfully deleted a favorite thing."
        redirect to '/favorites'
      end
    end
  end

end
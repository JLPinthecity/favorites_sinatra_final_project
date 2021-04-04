require 'pry'
class FavoritesController < ApplicationController

  get '/favorites' do 
    if logged_in?
      @user = current_user
      @favorites = @user.favorites
      if @favorites 
        erb :"favorites/index"
      else
        flash[:need_favorite] = "Log your first favorite!"
        redirect to '/favorites/new' 
      end
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
      if @favorite && @favorite.user == current_user
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
      @favorite = Favorite.find(params[:id])
      params[:favorite].each do |label, input|
        if input.empty? 
          flash[:edit_error] = "Please enter a value for #{label}. Can't be blank."
          redirect to "/favorites/#{@favorite.id}"
        else
          if @favorite && @favorite.user_id == current_user.id
             @new_url = Url.new(:link => params[:favorite][:url])
             @favorite.update(:category => params[:favorite][:category], :name => params[:favorite][:name], :notes => params[:favorite][:notes], :url => @new_url)
             redirect to "/favorites/#{@favorite.id}"
          else
             flash[:wrong_user] = "Sorry you can only edit or delete your own favorites."
             redirect to '/favorites'
          end
        end
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
require 'pry'
class UsersController < ApplicationController

  get '/signup' do
    if logged_in?
       flash[:already_logged_in] = "You already have an account and are logged in."
       redirect to "/favorites"
    else
      erb :"users/signup"
    end
  end

  post "/signup" do
    params.each do |label, input|
        if input.empty?
            flash[:signup_error] = "Please enter a value for #{label}"
            redirect to "/signup"
        else
          @user = User.new(params[:user])
          @user.save
          session[:user_id] = @user.id
          redirect to "/favorites"
        end
    end
  end

  get '/login' do
    if logged_in?
        flash[:logged_in_already] = "Welcome back! You're already logged in."
        redirect to '/favorites'
    else
        erb :"/users/login"
    end
  end

  get '/logout' do
    erb :"users/logout"
  end


end

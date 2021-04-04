require 'pry'
class UsersController < ApplicationController

  get '/signup' do
    if logged_in?
       flash[:logged_in] = "Welcome! You're logged in."
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
        flash[:logged_in] = "Welcome! You're logged in."
        redirect to '/favorites'
    else
        erb :"/users/login"
    end
  end

  post '/login' do
    user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect to "/favorites"
    else
      flash[:login_error] = "Username or password not recognized. Please sign up for an account or try again."
      redirect to "/"
    end
  end

  get '/logout' do
    if logged_in?
      session.destroy
      flash[:logout_success] = "You have logged out."
      redirect to "login"
    else
      redirect to "/"
    end
  end


end

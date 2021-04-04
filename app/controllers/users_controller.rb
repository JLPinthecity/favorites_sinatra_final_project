require 'pry'
class UsersController < ApplicationController

  get '/signup' do #flash works
    if logged_in?
       flash[:logged_in] = "Welcome! You're logged in."
       redirect to "/favorites"
    else
      erb :"users/signup"
    end
  end

  post "/signup" do #flash messages work
    params.each do |label, input|
        if input.empty?  
            flash[:signup_error] = "Please enter a value for #{label}"
            redirect to "/signup"
        else
            check_email = params[:user][:email]
            check_username = params[:user][:username]
              if User.find_by(:email => check_email) || User.find_by(:username => check_username) 
                flash[:already_exists] = "Email or username entered is associated with existing account."
                redirect to "/"
                binding.pry
              else
                @user = User.new(params[:user])
                @user.save
                session[:user_id] = @user.id
                flash[:logged_in] = "Welcome! You're logged in."
                redirect to "/favorites"
              end
        end
    end
  end

  get '/login' do #flash working
    if logged_in?
        flash[:logged_in] = "Welcome! You're logged in."
        redirect to '/favorites'
    else
        erb :"/users/login"
    end
  end

  post '/login' do   #flash messages work
    user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:logged_in] = "Welcome! You're logged in."
      redirect to "/favorites"
    else
      flash[:error] = "Username or password not recognized. Please sign up for an account or try again."
      redirect to "/"
    end
  end

  get '/logout' do 
    if logged_in?
      session.destroy
      erb :"users/logout"
    else
      redirect to "/"
    end
  end

end

class UsersController < ApplicationController

  get '/signup' do
    if logged_in?
       flash[:message] = "You already have an account and are logged in."
       redirect to "/favorites"
    else
      erb :"users/signup"
    end
  end

  post "/signup" do
  end


end

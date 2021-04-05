require 'pry'
class UrlsController < ApplicationController

    get '/links' do 
        if logged_in?
            @user = current_user
            @urls = @user.urls
            erb :"urls/index"
        else
            flash[:not_logged_in] = "Please log in."
            redirect to '/'
        end
    end

end

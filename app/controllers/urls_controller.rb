require 'pry'
class UrlsController < ApplicationController

    get '/links' do 
        if logged_in?
       
            @urls = Url.all
            @user = current_user

            @urls 
        binding.pry
            erb :"urls/index"
            
        else
            
        end
  
    
    end


end

class User < ActiveRecord::Base
  has_many :favorites
  has_many :urls, through: :favorites 
  has_secure_password
end
  

class Urls < ActiveRecord::Base
  belongs_to :favorites
  belongs_to :user
end
  
  
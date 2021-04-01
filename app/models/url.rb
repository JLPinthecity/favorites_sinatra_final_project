class Urls < ActiveRecord::Base
  belongs_to :favorites
  belong_to :user
end
  
  
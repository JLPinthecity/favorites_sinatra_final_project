class Url < ActiveRecord::Base
  belongs_to :favorites
  belongs_to :user
end
  
  
class Url < ActiveRecord::Base
  belongs_to :favorite
  belongs_to :user
end
  

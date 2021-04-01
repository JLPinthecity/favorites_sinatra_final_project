class Favorites < ActiveRecord::Base
  has_one :url
  belongs_to :user
end


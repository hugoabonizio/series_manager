class Favorite < ActiveRecord::Base
  belongs_to :serie
  belongs_to :user
end

class UserPreference < ActiveRecord::Base
  belongs_to :user
  belongs_to :afinity
end

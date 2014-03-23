class Afinity < ActiveRecord::Base
  has_many :user_preferences
  has_many :users, through: :user_preferences
  AFINITY = ["Coding", "Photography", "Cooking", "Academic"]
end

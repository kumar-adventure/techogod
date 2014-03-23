# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
AccountType::USER_PREFERENCES.each do |user_preference|
  account_type = AccountType.where(name: user_preference).first 
  account_type ||= AccountType.create(name: user_preference)
end


Afinity::AFINITY.each do |afinity|
  user_afinity = Afinity.where(name: afinity).first
  user_afinity ||= Afinity.create(name: afinity)
end
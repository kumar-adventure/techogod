class AccountType < ActiveRecord::Base
	has_many :users

	USER_PREFERENCES = ["Learn", "Teach"]
end

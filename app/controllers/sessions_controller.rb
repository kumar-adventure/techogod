class SessionsController < Devise::SessionsController
  skip_before_filter :check_account_type
end  

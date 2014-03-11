Rails.application.config.middleware.use OmniAuth::Builder do
  # The following is for facebook
  provider :facebook, '569762796405010', '9127609676b433ec4b8b299b30365c68'
 
  # If you want to also configure for additional login services, they would be configured here.
end
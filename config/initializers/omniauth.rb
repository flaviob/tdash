Rails.application.config.middleware.use OmniAuth::Builder do
  puts "Google Client ID: #{ENV['GOOGLE_CLIENT_ID']}"
  puts "Google Client Secret: #{ENV['GOOGLE_CLIENT_SECRET']}"
  provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET']
  OmniAuth.config.allowed_request_methods = [:post, :get]
  OmniAuth.config.silence_get_warning = true
end

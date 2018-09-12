Rails.application.config.middleware.use OmniAuth::Builder do
  provider :nctu, ENV['NCTU_KEY'], ENV['NCTU_SECRET']
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
  provider :google_oauth2, ENV['GOOGLE_KEY'], ENV['GOOGLE_SECRET']
end

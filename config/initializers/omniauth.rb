Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :github, ENV['github_key'], ENV['github_secret']
end

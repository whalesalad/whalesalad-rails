source 'https://rubygems.org'

ruby "2.0.0"

gem 'rails', '4.0.0.beta1'
gem 'pg'
gem 'haml'
gem 'thin'
gem 'stringex'
gem 'kaminari'
gem 'redcarpet'
gem 'pygmentize'

# Gems used only for assets and not in production
group :assets do
  gem 'sass-rails',   '~> 4.0.0.beta1'
  gem 'coffee-rails', '~> 4.0.0.beta1'
  gem 'uglifier', '>= 1.0.3'
  gem 'jquery-rails'
  gem 'asset_sync'
end

group :development, :test do
  gem 'pry-rails'
  gem 'quiet_assets'
  gem 'annotate'
  gem 'bullet'
end

group :production do
  gem "sentry-raven", :git => "https://github.com/getsentry/raven-ruby.git"
end
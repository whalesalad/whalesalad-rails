source 'https://rubygems.org'

ruby "1.9.3"

gem 'rails', '3.2.11'
gem 'bcrypt-ruby', '~> 3.0.0'
gem 'pg'
gem 'haml'
gem 'thin'
gem 'stringex'
gem 'kaminari'
gem 'redcarpet'
gem 'pygmentize'

# Gems used only for assets and not in production
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  gem 'jquery-rails'
  gem 'asset_sync'
end

group :development, :test do
  gem 'pry-rails'
  gem 'annotate', :git => 'git://github.com/jeremyolliver/annotate_models.git', :branch => 'rake_compatibility'
end

group :production do
  gem "sentry-raven", :git => "https://github.com/getsentry/raven-ruby.git"
end
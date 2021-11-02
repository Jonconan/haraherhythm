source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.2'

gem 'rails', '~> 6.1.4'
gem 'mysql2'
gem 'puma'
gem 'sass-rails'
gem 'webpacker'
gem 'turbolinks'
gem 'jbuilder'
gem 'devise'
gem "nokogiri", ">= 1.12.5"

gem 'bootsnap'
gem "aws-sdk-s3", require: false
gem 'fog-aws'
gem 'carrierwave'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console'
  gem 'listen'
  gem 'spring'
  gem 'spring-watcher-listen'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

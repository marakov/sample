source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem 'rails'

group :development, :test do
  gem 'sqlite3', '1.3.8'
  gem 'rspec-rails', '2.13.1'
end

group :test do
  gem 'selenium-webdriver', '2.35.1'
  gem 'capybara', '>= 2.15'
end

gem 'sass-rails', '~> 5.0'
gem 'uglifier', '~> 2.1.1'
gem 'coffee-rails'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

group :doc do
  gem 'sdoc', require: false
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

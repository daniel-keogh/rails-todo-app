source 'https://rubygems.org'

ruby '2.6.6'
gem 'rails', '4.2.11'

group :development, :test do
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3', '~> 1.3.6'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'rspec-rails', '3.7.2'
  gem 'guard-rspec'  
  gem 'database_cleaner', '1.4.1' # clears Cucumber's test database between runs
  gem 'capybara', '2.4.4' # allows Cucumber to impersonate a browser so it can interact with web pages
  gem 'launchy'  # debugging aids
  # Access an IRB console on exception pages or by using <%= console %> in views
  # gem 'web-console', '~> 2.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'  
end

group :test do
  gem 'cucumber-rails', :require => false
  gem 'cucumber-rails-training-wheels'
  gem 'simplecov', :require => false
  gem 'rspec'
end

group :production do
  gem 'pg', '~> 0.21' # for Heroku deployment
  # gem 'rails_12factor'
end

# Gems used only for assets and not required
# in production environments by default.
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0.3'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 2.7.1'
# Use jquery as the JavaScript library
gem 'jquery-rails'
source 'https://rubygems.org'

gem 'rails', '3.2.3'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platform => :ruby

  gem 'uglifier', '>= 1.0.3'
  gem 'jquery-datatables-rails', :git => 'git://github.com/rweng/jquery-datatables-rails.git'
  gem 'jquery-ui-rails'
end

group :development do
  gem 'sqlite3'
  gem 'libnotify'
end
group :production do
  gem 'pg'
end
gem "rspec-rails", :group => [:test, :development]
group :test do
  gem "factory_girl_rails"
  gem "launchy"
  gem "capybara"
  gem "database_cleaner"
  gem "shoulda"
  gem "guard-rspec"
end

gem 'jquery-rails'
gem 'will_paginate'
gem 'omniauth-identity'

# To use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'
#gem 'ruby-debug19', :require => 'ruby-debug'
#gem 'linecache19', '0.5.13', :path => "~/.rvm/gems/ruby-1.9.3-head/gems/linecache19-0.5.13/"
#gem 'ruby-debug-base19', '0.11.26', :path => "~/.rvm/gems/ruby-1.9.3-head/gems/ruby-debug-base19-0.11.26/"

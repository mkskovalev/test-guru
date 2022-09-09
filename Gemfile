source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.0'


gem 'rails', '~> 6.1.6'
# gem 'sqlite3', '~> 1.4'
gem 'pg'
gem 'puma', '~> 5.0'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'
# gem 'redis', '~> 4.0'
# gem 'bcrypt', '~> 3.1.7'
# gem 'image_processing', '~> 1.2'
gem 'spring'

# UI
gem 'bootstrap', '~> 5.2.0'
gem 'octicons_helper'

# AUTH
gem 'devise', '~> 4.1'

# LOCALIZATION
gem 'rails-i18n'

# NETWORKING
gem 'faraday'
gem "octokit", "~> 5.0"

gem 'dotenv-rails', groups: [:development, :test]

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '>= 4.1.0'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  gem 'letter_opener'
  gem 'bootsnap'
end

group :test do
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver', '>= 4.0.0.rc1'
  gem 'webdrivers'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

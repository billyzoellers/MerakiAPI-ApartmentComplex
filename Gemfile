source 'https://rubygems.org'

gem 'rails', '5.2.0'

# THEME
gem 'sass-rails'                # Use SCSS for stylesheets
gem 'bootstrap'                 # Use Boostrap 4
gem 'rails-assets-tether'       # needed for Bootstrap 4
gem 'font-awesome-sass'         # Use fontawesome icons

## JAVASCRIPT
gem 'jquery-rails'        # jQuery JavaScript library
gem 'uglifier'            # Use Uglifier as compressor for JavaScript assets
gem 'coffee-rails'        # Use CoffeeScript for .coffee assets and views

## FRAMEWORKS
gem 'turbolinks'                                        # Turbolinks
gem 'jbuilder', '~> 2.0'                                # Build JSON APIs
gem 'sdoc', '~> 0.4.0', group: :doc                     # bundle exec rake doc:rails generates the API under doc/api.
gem 'httparty'                                          # APi access

## APP FUNCTIONALITY
gem 'devise'                                            # Authentication
gem 'kaminari'                                          # Pagination
gem 'bootstrap4-kaminari-views'                         # Pagination theme
gem 'ransack', github: 'activerecord-hackery/ransack'   # Searching
gem 'validates_formatting_of'                           # validate models better

## PRODUCTION ONLY
group :production do
  gem 'pg'                      # Prod database - PostgreSQL
end
## DEV AND TESTING
group :development, :test do
  gem 'byebug'                  # Debugging console 'byebug'
  gem 'sqlite3'                 # Dev database - SQLite
end

## DEVELOPMENT ONL
group :development do
  gem 'web-console', '~> 2.0'   # <%= console %> for web console in view
  gem 'spring'                  # Keep application running in background 
end
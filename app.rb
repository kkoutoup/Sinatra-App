# Dependencies
require "sinatra"
require "sinatra/reloader" if development?
require "pry-byebug"
require "better_errors"
require "sqlite3"

# Better Errors
configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path('..', __FILE__)
end

# db file path
db_file_path = File.join(File.dirname(__FILE__), "data/posts_spec.db")

# create a database instance
DB = SQLite3::Database.new(db_file_path)

# Views
get '/' do
  erb :index # view
end

get '/about'do
  erb :about
end

get '/team/:username' do
  puts params[:username]
  "The username is #{params[:username]}"
end
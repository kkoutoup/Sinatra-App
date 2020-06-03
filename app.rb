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
db_file_path = File.join(File.dirname(__FILE__), "data/jukebox.sqlite")

# create a database instance
DB = SQLite3::Database.new(db_file_path)

# Views
get '/' do
  @artists = DB.execute("SELECT * FROM artists LIMIT 20")
  @artists_count = DB.execute("SELECT COUNT (*) FROM artists").flatten.first
  @albums_count = DB.execute("SELECT COUNT (*) FROM albums").flatten.first
  @songs_count = DB.execute("SELECT COUNT (*) FROM tracks").flatten.first
  @songs_duration = DB.execute("SELECT SUM (tracks.milliseconds * 1.66667e-5) / 60 FROM tracks").flatten.first.round
  @genres_count = DB.execute("SELECT COUNT (*) FROM genres").flatten.first
  erb :index
end

get '/artists/:id' do
  erb :artist
end
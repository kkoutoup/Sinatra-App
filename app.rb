require "sinatra"
require "sinatra/reloader" if development?
require "pry-byebug"
require "better_errors"

configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path(__dir__)
end

require_relative "config/application"

set :views, (proc { File.join(root, "app/views") })
set :bind, '0.0.0.0'
set :sessions, true
set :public_folder, File.dirname(__FILE__) + '/public'

get '/' do
  @message = session.delete(:message)
  @posts = Post.all
  @posts_count = Post.count
  @user_count = User.count
  erb :posts
end

get '/most-voted-posts' do
  @most_voted_first = Post.most_voted_first
  erb :most_voted_first
end

get '/most-recent-posts' do
  @most_recent_first = Post.most_recent_first
  erb :most_recent_first
end

get '/oldest-posts' do
  @oldest_posts = Post.oldest_posts
  erb :oldest_posts
end

post '/' do
  create_post(params) unless perform_checks(params)
  redirect '/'
end

# helper methods
def check_for_empty_params(params)
  session[:message] = "Couldn't save post. Missing information." if params.values.any?("")
end

def check_for_existing_post(params)
  @post = Post.find_by title: params[:title].strip
  session[:message] = "A post with this title already exists." if @post
end

def perform_checks(params)
  check_for_empty_params(params) || check_for_existing_post(params)
end

def create_post(params)
  Post.create(
    title: params['title'],
    url: params['url'],
    votes: params['votes'] || 0,
    date: params['date'],
    user_id: 1
  )
  session[:message] = "New post added!"
end

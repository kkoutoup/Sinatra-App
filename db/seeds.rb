require 'json'
require 'rest-client'
require 'faker'
require 'time'
require 'date'

def parse_endpoint(url)
  JSON.parse(RestClient.get(url))
end

top_stories = parse_endpoint("https://hacker-news.firebaseio.com/v0/topstories.json").first(70)

data = top_stories.map { |story_id| parse_endpoint("https://hacker-news.firebaseio.com/v0/item/#{story_id}.json") }

# Create 10 users from Faker
users = []
10.times do
  users <<  User.create(
    username: Faker::Internet.user_name,
    email: Faker::Internet.free_email
  )
end

# Create posts with Hacker News API - assign to users
data.each do |item|
  sleep(10) # fake delay so we can order by created_at later
  Post.create(
    title: item["title"],
    url: item["url"],
    votes: item["score"],
    date: Time.now.strftime("%d-%m-%Y"),
    user: users.sample
  )
end

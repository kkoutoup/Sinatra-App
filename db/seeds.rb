require 'json'
require 'rest-client'

def parse_endpoint(url)
  JSON.parse(RestClient.get(url))
end

top_stories = parse_endpoint("https://hacker-news.firebaseio.com/v0/topstories.json").first(30)

data = top_stories.map { |story_id| parse_endpoint("https://hacker-news.firebaseio.com/v0/item/#{story_id}.json") }

users = User.create(username: data.first["by"], email: data.first["by"] + "@hackernews.com")

(1..30).step(1) do |n|
  Post.create(
    title: data[n]["title"],
    url: data[n]["url"],
    votes: data[n]["score"],
    user_id: 1
  )
end

# Sinatra App - Hakker News
A simple experimentation with the Sinatra micro framework. This is a mock app of [Hacker News](https://news.ycombinator.com/). Seed data are a combination of `Faker` data and posts scaraped from Hacker News.

## Setup
Clone the repository locally. Launch the app by typing `ruby app.rb` in your terminal. Open your browser to `localhost:4567` (Sinatra's default port) to interact with the app.

## Functionality
App has three routes that users can access through the links on top. Users are also able to submit a new post to be added to the list.

### File structure
.app
  |_models
    |_post.rb
    |_user.rb
  |_views
    |_layout.erb
    |_most_recent_first.erb
    |_most_voted_first.erb
    |_oldest_posts.erb
    |_posts.erb
.config
  |_application.rb
  |_database.yml
.db
  |_migrate.rb
  |_development.sqlite3
  |_fake_data
  |_schema.rb
  |_seeds.rb
.public
  |_js
    |_application.js
  |_styles
    |_application.css
.spec
  |_spec_helper.rb
.rubocop.yml
.app.rb
.Gemfile
.Gemfile.lock
.Rakefile
.README.md

## Dependencies
* Ruby 2.6
* [Sinatra](http://sinatrarb.com/)
* [Bootstrap 4.3.1](https://getbootstrap.com/)
* [SQLite3](https://www.sqlite.org/index.html)
### For seeding with mock data
* [JSON](https://ruby-doc.org/stdlib-2.6.3/libdoc/json/rdoc/JSON.html)
* [RestClient](https://github.com/rest-client/rest-client)
* [Faker](https://github.com/faker-ruby/faker)
There is a `fake_data.rb` file in the `db` folder with a sample of data used for this prototype.
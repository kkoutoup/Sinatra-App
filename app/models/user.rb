class User < ActiveRecord::Base
  has_many :posts
  validates :username, presence: true, uniqueness: true
  validates :email, format: { with: /[a-z]+\@[a-z]+\.com/, message: "is invalid" }, presence: true
end

class User < ActiveRecord::Base
  has_many :posts
  validates :username, presence: true, uniqueness: true
  validates :email, format: { with: /[a-zA-Z\.\_]+@[a-zA-Z]+\.com?/, message: "is invalid" }, presence: true
end

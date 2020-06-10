class Post < ActiveRecord::Base
  belongs_to :user
  validates :user, presence: true
  validates :votes, numericality: { only_integer: true }
  validates :title, uniqueness: { case_sensitive: false }, presence: true, length: { minimum: 5 }
  validates :url, format: { with: /https?.*/, message: "is invalid" }, presence: true
  scope :most_voted_first, -> { order(:votes).reverse_order }
end

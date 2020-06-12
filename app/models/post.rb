class Post < ActiveRecord::Base
  belongs_to :user
  validates :user, presence: true
  validates :date, format: { with: /\d{2}\-\d{2}\-\d{4}/, message: "Date format is invalid" }, presence: true
  validates :votes, presence: true
  validates :title, uniqueness: { case_sensitive: false }, presence: true, length: { minimum: 5 }
  validates :url, format: { with: /https?.*/, message: "url format is invalid" }, presence: true
  scope :most_voted_first, -> { order(:votes).reverse_order }
  scope :most_recent_first, -> { order(created_at: :desc) }
  scope :oldest_posts, -> { order(created_at: :asc) }
end

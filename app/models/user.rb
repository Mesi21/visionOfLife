class User < ApplicationRecord
  validates :name, presence: true
  has_many :posts
  has_many :likes
  has_many :comments

  def most_recent_three_posts
    post.order('created_at DESC').last(3)
  end
end

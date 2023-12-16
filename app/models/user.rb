class User < ApplicationRecord
  validates :name, presence: true, length: { in: 3..25 }
  validates :posts_counter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }
  has_many :posts
  has_many :likes
  has_many :comments

  def most_recent_three_posts
    posts.order('created_at DESC').last(3)
  end
end

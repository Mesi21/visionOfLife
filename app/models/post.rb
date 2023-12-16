class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }
  belongs_to :user
  has_many :comments
  has_many :likes
  after_create :update_post_counter

  def update_post_counter
    user.update(posts_counter: user.posts.count)
  end

  def most_recent_five_comments
    comments.order('created_at DESC').last(5)
  end
end

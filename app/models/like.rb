class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post
  after_create :update_counter_for_likes

  private

  def update_counter_for_likes
    post.update(likes_counter: post.likes.count)
  end
end

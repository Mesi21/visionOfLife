class Comment < ApplicationRecord
  validates :text, presence: true
  belongs_to :user
  belongs_to :post
  after_create :update_counter_for_comments

  private

  def update_counter_for_comments
    post.update(comments_counter: post.comments.count)
  end
end

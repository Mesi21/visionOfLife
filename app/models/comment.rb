class Comment < ApplicationRecord
  validates :text, presence: true
  belongs_to :user
  belongs_to :post
  after_save :update_counter_for_comments

  private

  def update_counter_for_comments
    post.increment!(:comments_counter)
  end
end

class Comment < ApplicationRecord
  validates :text, presence: true
  belongs_to :user
  belongs_to :post

  private

  def update_counter_for_comments
    post.increment!(:comments_counter)
  end
end

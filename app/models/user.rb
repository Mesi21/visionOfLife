class User  < ApplicationRecord
    validates :name, presence: true
    has_many :posts

    def most_recent_three_posts
        post.order('created_at DESC').last(3)
    end
end
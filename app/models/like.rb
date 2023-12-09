class Like <ApplicationRecord
    belongs_to :user
    belongs_to :post
    after_save :update_counter_for_likes

    private

    def update_counter_for_likes
        post.increment(:likes_counter)
    end
end
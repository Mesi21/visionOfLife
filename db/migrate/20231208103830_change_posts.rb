class ChangePosts < ActiveRecord::Migration[7.0]
  def change
    change_column :posts, :text, :text
  end
end

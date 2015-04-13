class AddDetailsToLike < ActiveRecord::Migration
  def change
    add_column :likes, :user_id, :integer
    remove_column :posts, :rating
  end
end

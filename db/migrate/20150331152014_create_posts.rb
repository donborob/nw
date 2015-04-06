class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id, null: false, default: ""
      t.string :title
      t.text :content, null: false, default: ""
      t.timestamps
    end
  end
end

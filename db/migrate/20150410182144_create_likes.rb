class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :post_id
      t.boolean :likes
      t.timestamps
    end
  end
end

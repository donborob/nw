class AddDetailsToComments < ActiveRecord::Migration
  def change
    add_column :comments,:user_id, :integer
    remove_column :comments, :user_name
  end
end

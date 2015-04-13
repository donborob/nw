class AddDetailsToConversation < ActiveRecord::Migration
  def change
    remove_column :conversations, :first_id
    remove_column :conversations, :second_id
    add_column :conversations, :user_id, :integer
    add_column :conversations, :partner_id, :integer
  end
end

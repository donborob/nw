class RemoveUserIdFromConversation < ActiveRecord::Migration
  def change
    remove_column :conversations, :user_id, :integer
  end
end

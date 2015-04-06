class DeleteGenderCdFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :gender_cd

  end
end

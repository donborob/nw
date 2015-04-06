class AddDetailsToUser < ActiveRecord::Migration
  def change
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
    add_column :users, :birthday, :date
    add_column :users, :gender_cd, :integer
    add_column :users, :extra, :text
  end
end

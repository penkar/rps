class TwoUsersInGame < ActiveRecord::Migration
  def change
    remove_column :games, :user_id
    add_column :games, :user1, :integer
    add_column :games, :user2, :integer
  end
end

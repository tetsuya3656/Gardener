class ChangeDataUsersToAddress < ActiveRecord::Migration[6.1]
  def change
    change_column :address, :users, :integer
  end
end

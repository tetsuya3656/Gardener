class ChangeDatatypeAddressOfUsers < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :address, :integer
  end
end

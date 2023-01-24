class RemoveColumnImage < ActiveRecord::Migration[6.1]
  def up
    remove_column :users, :image, :string
  end

  def down
    add_column :users, :image, :string
    
  end
end

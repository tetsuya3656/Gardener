class RemoveImageFromPostimage < ActiveRecord::Migration[6.1]
  def change
    remove_column :postimages, :image, :string
  end
end

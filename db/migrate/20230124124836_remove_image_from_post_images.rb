class RemoveImageFromPostImages < ActiveRecord::Migration[6.1]
  def change
    remove_column :post_images, :image, :string
  end
end

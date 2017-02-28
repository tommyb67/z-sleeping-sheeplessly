class AddImageToBanners < ActiveRecord::Migration[5.0]
  def change
    add_column :banners, :image, :string
  end
end

class AddImageToTrolls < ActiveRecord::Migration
  def change
    add_column :trolls, :image, :string
  end
end

class CreateCategoryTrolls < ActiveRecord::Migration
  def change
    create_table :category_trolls do |t|
      t.integer :troll_id
      t.integer :category_id

      t.timestamps null: false
    end
  end
end

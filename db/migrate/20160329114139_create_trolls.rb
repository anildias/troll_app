class CreateTrolls < ActiveRecord::Migration
  def change
    create_table :trolls do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end

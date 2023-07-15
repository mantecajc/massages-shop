class CreateMassages < ActiveRecord::Migration[7.0]
  def change
    create_table :massages do |t|
      t.string :title, null: false
      t.string :subtitle, null: false
      t.integer :duration, null: false
      t.integer :price, null: false
      t.text :brief_description, null: false
      t.text :large_description, null: false

      t.timestamps
    end
  end
end

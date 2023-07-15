class AddCategoryIdToMassages < ActiveRecord::Migration[7.0]
  def change
    add_reference :massages, :category, null: false, foreign_key: true
  end
end

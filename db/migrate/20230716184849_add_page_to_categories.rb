class AddPageToCategories < ActiveRecord::Migration[7.0]
  def change
    add_column :categories, :page, :string
  end
end

class CreatePagesContents < ActiveRecord::Migration[7.0]
  def change
    create_table :pages_contents do |t|
      t.string :home_title
      t.text :home_description

      t.timestamps
    end
  end
end

class CreateInfos < ActiveRecord::Migration[7.0]
  def change
    create_table :infos do |t|
      t.string :content

      t.timestamps
    end
  end
end

class CreateZaikos < ActiveRecord::Migration[5.2]
  def change
    create_table :zaikos do |t|
      t.string :content
      t.integer :number
      t.string :image_name
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

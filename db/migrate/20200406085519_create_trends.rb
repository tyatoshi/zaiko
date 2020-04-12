class CreateTrends < ActiveRecord::Migration[5.2]
  def change
    create_table :trends do |t|
      t.integer :article
      t.integer :increase
      t.integer :decrease
      t.string :user_id
      t.references :zaiko, foreign_key: true

      t.timestamps
    end
  end
end

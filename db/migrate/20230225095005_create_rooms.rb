class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.string :name
      t.integer :beds
      t.decimal :price
      t.text :description
      t.string :image
      t.string :city
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class CreateChalets < ActiveRecord::Migration[6.0]
  def change
    create_table :chalets do |t|
      t.string :name
      t.text :description
      t.string :country
      t.string :address
      t.integer :number_of_guests
      t.integer :number_of_bedrooms
      t.integer :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

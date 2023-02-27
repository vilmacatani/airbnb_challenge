class CreateOfferings < ActiveRecord::Migration[7.0]
  def change
    create_table :offerings do |t|
      t.string :title
      t.boolean :available
      t.text :description
      t.string :type
      t.float :price_per_night
      t.string :address
      t.string :country
      t.string :cit
      t.integer :size
      t.float :average_rating
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

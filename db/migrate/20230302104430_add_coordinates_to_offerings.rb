class AddCoordinatesToOfferings < ActiveRecord::Migration[7.0]
  def change
    add_column :offerings, :latitude, :float
    add_column :offerings, :longitude, :float
  end
end

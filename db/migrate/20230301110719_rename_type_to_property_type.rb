class RenameTypeToPropertyType < ActiveRecord::Migration[7.0]
  def change
    rename_column :offerings, :type, :property_type
  end
end

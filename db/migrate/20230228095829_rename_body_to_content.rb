class RenameBodyToContent < ActiveRecord::Migration[7.0]
  def change
    rename_column :offerings, :cit, :city
  end
end

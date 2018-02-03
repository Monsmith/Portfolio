class AddPositionToPortfs < ActiveRecord::Migration[5.1]
  def change
    add_column :portfs, :position, :integer
  end
end

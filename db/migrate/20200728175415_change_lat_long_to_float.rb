class ChangeLatLongToFloat < ActiveRecord::Migration[6.0]
  def change
    change_column :parks, :lat, :float
    change_column :parks, :long, :float
    
  end
end

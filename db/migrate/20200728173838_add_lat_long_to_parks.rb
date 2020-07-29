class AddLatLongToParks < ActiveRecord::Migration[6.0]
  def change
    add_column :parks, :lat, :integer
    add_column :parks, :long, :integer
    
  end
end

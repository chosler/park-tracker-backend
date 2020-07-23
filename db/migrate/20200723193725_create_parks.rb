class CreateParks < ActiveRecord::Migration[6.0]
  def change
    create_table :parks do |t|
      t.string :name
      t.string :state
      t.string :activity
      t.float :entrance_fee
      t.string :img_url
      t.string :img2_url
      t.string :img3_url
      t.string :operating_hours
      t.string :description

      t.timestamps
    end
  end
end

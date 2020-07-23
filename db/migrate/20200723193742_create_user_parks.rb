class CreateUserParks < ActiveRecord::Migration[6.0]
  def change
    create_table :user_parks do |t|
      t.integer :user_id
      t.integer :park_id
      t.integer :comment_id
      t.boolean :park_stamp
      

      t.timestamps
    end
  end
end

class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.integer :user_park_id
      t.string :comment_content

      t.timestamps
    end
  end
end

class DeleteColumnOnComments < ActiveRecord::Migration[6.0]
  def change
    remove_column :comments, :user_park_id, :integer
  end
end

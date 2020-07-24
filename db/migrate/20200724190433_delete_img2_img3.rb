class DeleteImg2Img3 < ActiveRecord::Migration[6.0]
  def change
    remove_column :parks, :img2_url
    remove_column :parks, :img3_url
    remove_column :parks, :img_url
  end
end

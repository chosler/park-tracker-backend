class AddImgArray < ActiveRecord::Migration[6.0]
  def change
    add_column :parks, :img_urls, :string, array: true, default: []
    
  end
end

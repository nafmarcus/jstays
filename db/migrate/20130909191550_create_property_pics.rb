class CreatePropertyPics < ActiveRecord::Migration
  def change
    create_table :property_pics do |t|
      t.references :property
      t.attachment :image

      t.timestamps
    end
    add_index :property_pics, :property_id
  end
end
class CreatePropertyReviews < ActiveRecord::Migration
  def change
    create_table :property_reviews do |t|
      t.integer :user_id
      t.integer :property_id
      t.integer :rating
      t.text :body
      t.boolean :published

      t.timestamps
    end
  end
end

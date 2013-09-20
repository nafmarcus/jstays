class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.text   :addtl_emails
      t.string :password_digest
      t.string :remember_token

      t.string  :first_name
      t.string  :last_name
      t.string  :country
      t.string  :state
      t.string  :city
      t.string  :zip
      t.text    :address
      t.string  :phone_day
      t.string  :phone_eve
      t.string  :phone_cell
      t.string  :currency
      t.attachment  :photo

      t.boolean :admin, :default => false
      t.timestamps
    end
    add_index :users, :email, unique: true
    add_index :users, :remember_token
  end
end

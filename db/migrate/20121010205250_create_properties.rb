class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.integer :user_id
      t.decimal :price
      t.string :address
      t.string :type
      t.integer :beds
      t.integer :baths
      t.string :contact_name
      t.integer :contact_phone
      t.string :contact_email
      t.text :notes

      t.timestamps
    end
    add_index :properties, [:user_id]
  end
end

class CreateChecklists < ActiveRecord::Migration
  def change
    create_table :checklists do |t|
      t.string :item
      t.integer :user_id
      t.integer :unchecked
      t.integer :checked

      t.timestamps
    end
    add_index :checklists, [:user_id]
  end
end

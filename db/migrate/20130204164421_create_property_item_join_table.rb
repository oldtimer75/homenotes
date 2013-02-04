class CreatePropertyItemJoinTable < ActiveRecord::Migration
  def self.up
   create_table :items_properties, :id => false do |t| #we DO NOT need the id here!
     t.references :property, null: false
     t.references :item, null: false
   end
  end
 
  def self.down
    drop_table :items_properties
  end

  #add_index :items_properties, [:item_id, :property_id], unique: true
end
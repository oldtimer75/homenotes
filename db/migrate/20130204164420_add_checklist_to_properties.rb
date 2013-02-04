class AddChecklistToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :checklist, :integer
  end
end

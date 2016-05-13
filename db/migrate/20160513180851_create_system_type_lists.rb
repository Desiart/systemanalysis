class CreateSystemTypeLists < ActiveRecord::Migration
  def change
    create_table :system_type_lists do |t|
    	t.integer :system_type_id
    	t.integer :system_id
      t.timestamps null: false
    end
  end
end

class CreateSystemLists < ActiveRecord::Migration
  def change
    create_table :system_lists do |t|
    	t.integer :user_id
    	t.integer :system_id
      t.timestamps null: false
    end
  end
end

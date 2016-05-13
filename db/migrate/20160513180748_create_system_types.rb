class CreateSystemTypes < ActiveRecord::Migration
  def change
    create_table :system_types do |t|
    	t.string :name
      t.timestamps null: false
    end
  end
end

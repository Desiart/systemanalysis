class AddOwnerIdToSystems < ActiveRecord::Migration
  def change
    add_column :systems, :owner_id, :integer
  end
end

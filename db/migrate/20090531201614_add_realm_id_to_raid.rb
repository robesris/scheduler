class AddRealmIdToRaid < ActiveRecord::Migration
  def self.up
    add_column :raids, :realm_id, :integer
  end

  def self.down
    remove_column :raids, :realm_id
  end
end

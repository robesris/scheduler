class RemoveInstanceNameIdFromInstances < ActiveRecord::Migration
  def self.up
    remove_column :instances, :instance_name_id
  end

  def self.down
    add_column :instances, :instance_name_id, :integer
  end
end

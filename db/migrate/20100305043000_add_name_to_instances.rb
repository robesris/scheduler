class AddNameToInstances < ActiveRecord::Migration
  def self.up
    add_column :instances, :name, :string
  end

  def self.down
    remove_column :instances, :name
  end
end

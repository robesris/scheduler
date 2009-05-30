class CreateInstances < ActiveRecord::Migration
  def self.up
    create_table :instances do |t|
      t.integer :instance_name_id
      t.integer :size
      t.integer :expansion_id
      t.integer :level

      t.timestamps
    end
  end

  def self.down
    drop_table :instances
  end
end

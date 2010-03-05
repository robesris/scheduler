class DropInstanceNames < ActiveRecord::Migration
  def self.up
    drop_table :instance_names
  end

  def self.down
    create_table :instance_names do |t|
      t.string :name

      t.timestamps
    end
  end
end

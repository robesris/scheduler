class CreateInstanceNames < ActiveRecord::Migration
  def self.up
    create_table :instance_names do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :instance_names
  end
end

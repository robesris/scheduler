class CreateRaids < ActiveRecord::Migration
  def self.up
    create_table :raids do |t|
      t.integer :instance_id
      t.datetime :raid_time
      t.string :code
      t.string :password
      t.boolean :searchable
      t.boolean :protected
      t.integer :creator_id
      t.integer :min_gear_level
      t.integer :tanks
      t.integer :heals
      t.integer :dps

      t.timestamps
    end
  end

  def self.down
    drop_table :raids
  end
end

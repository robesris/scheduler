class CreateCharacterRaid < ActiveRecord::Migration
  def self.up
    create_table :character_raid, :id => false do |t|
      t.integer :character_id, :null => false
      t.integer :raid_id, :null => false
    end
  end

  def self.down
    drop_table :character_raid
  end
end

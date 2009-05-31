class CreateCharacters < ActiveRecord::Migration
  def self.up
    create_table :characters do |t|
      t.string :name
      t.integer :faction_id
      t.integer :race_id
      t.integer :class_id
      t.integer :level
      t.integer :gear_score

      t.timestamps
    end
  end

  def self.down
    drop_table :characters
  end
end

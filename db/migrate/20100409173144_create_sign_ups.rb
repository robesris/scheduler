class CreateSignUps < ActiveRecord::Migration
  def self.up
    create_table :sign_ups do |t|
      t.integer :character_id
      t.integer :raid_id
      t.integer :role_id

      t.timestamps
    end
  end

  def self.down
    drop_table :sign_ups
  end
end

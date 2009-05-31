class CreateCharacterRole < ActiveRecord::Migration
  def self.up
    create_table :character_role, :id => false do |t|
      t.integer :character_id, :null => false
      t.integer :role_id, :null => false
    end
  end

  def self.down
    drop_table :character_role
  end
end

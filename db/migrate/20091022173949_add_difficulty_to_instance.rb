class AddDifficultyToInstance < ActiveRecord::Migration
  def self.up
    add_column :instances, :difficulty, :string
  end

  def self.down
    remove_column :instances, :difficulty
  end
end
